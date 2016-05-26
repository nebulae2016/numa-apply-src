module NumaHelpers
	def tagged_nebulae_url
		get_loc_setting(:nebulae_link)
	end

	private

	def get_loc_setting(setting_name)
		location = ENV['location']
		config[:location_settings][location.to_s][setting_name.to_s]
	end

end
