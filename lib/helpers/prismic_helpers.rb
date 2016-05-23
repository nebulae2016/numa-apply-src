module PrismicHelpers
	def setup_prismic
		api = Prismic.api( config[:prismic_api_url] )
		
		data_main = api.form('everything')
										.query(Prismic::Predicates::at('document.type', config[:prismic_main_custom_type]))
										.submit(api.master_ref)
										.results.first

		data_articles = api.form('everything')
												.query(Prismic::Predicates::at('document.type', 'article'))
												.submit(api.master_ref)
												.results

		@data = data_main
		@faq_data = data_articles.find{|article| article.uid == "faq" }
		@how_to_data = data_articles.find{|article| article.uid == "how-to-apply" }
		
		@page = config[:prismic_main_custom_type]
		@result = @data
	end

	def main_data
		@data
	end

	def faq_data
		@faq_data
	end

	def how_to_data
		@how_to_data
	end

	def get_text_helper(attr_name)
		if @data["#{@page}.#{attr_name}"].present?
			return @data["#{@page}.#{attr_name}"].as_text()
		else
			""
		end
	end

	def get_rich_text_helper(attr_name)
		if @data["#{@page}.#{attr_name}"].present?
			resolver = Prismic.link_resolver('master'){ |doc_link| "http:#localhost/#{doc_link.id}" }
			return @data["#{@page}.#{attr_name}"].as_html(resolver)
		else
			""
		end
	end

	def get_group_helper(group_name)
		if @data["#{@page}.#{group_name}"].present?
			return @data["#{@page}.#{group_name}"]
		else
			[]
		end
	end

	def get_link_helper(link_name)
		if @data["#{@page}.#{link_name}"].present?
			resolver = Prismic.link_resolver('master'){ |doc_link| "http:#localhost/#{doc_link.id}" }
			return @data.get_link("#{@page}.#{link_name}").url
		else
			""
		end
	end

	def get_title_helper
		if @data.fragments['meta-title'].present?
			@data.fragments['meta-title'].value
		else
			"Numa Apply"
		end
	end
end
