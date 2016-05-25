require 'yaml'

Dotenv.load

set :location_settings, YAML.load(File.read("numa_locations.yml"))

# General settings

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

require "lib/helpers/prismic_helpers"
helpers PrismicHelpers

configure :development do
  activate :livereload
end

activate :directory_indexes

activate :sprockets do |c|
  c.imported_asset_path = '/lib/'
end

def get_loc_setting(setting_name)
	location = ENV['location']
	config[:location_settings][location.to_s][setting_name.to_s]
end

puts get_loc_setting('prismic_url')
set :prismic_api_url, get_loc_setting('prismic_url')
set :prismic_main_custom_type, get_loc_setting('main_type')
set :prismic_article_custom_type, get_loc_setting('article_type')

configure :build do
	activate :relative_assets
	set :relative_links, true
  activate :minify_css
  activate :minify_javascript
end

def location_based_remote
	repo_owner = 	get_loc_setting(:repo_owner)
	repo_name = 	get_loc_setting(:repo_name)
	return "https://#{ENV['GH_TOKEN']}@github.com/#{repo_owner}/#{repo_name}.git"
end

activate :deploy do |deploy|
	deploy.deploy_method = :git
  deploy.remote = location_based_remote
	deploy.build_before = true
  deploy.commit_message = "Automated deploy at #{Time.now}"
end

# activate :google_analytics do |ga|
#   ga.tracking_id = 'UA-76972340-1'
#   ga.domain_name = 'somedomain.com'
#   ga.enhanced_link_attribution = true
#   ga.development = false
# end
