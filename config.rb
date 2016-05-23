Dotenv.load

# NUMA branch settings

set :prismic_api_url, 'https://numa-apply-blr.prismic.io/api'
set :prismic_main_custom_type, 'numa'
set :prismic_article_custom_type, 'article'

set :deploy_repo_owner, 'NumaParis'
set :deploy_repo_name, 'new-applyblr.numa.co'

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

configure :build do
  activate :relative_assets
	set :relative_links, true
  activate :minify_css
  activate :minify_javascript
end

activate :deploy do |deploy|
	deploy.deploy_method = :git
  deploy.remote = "https://#{ENV['GH_TOKEN']}@github.com/#{config[:deploy_repo_owner]}/#{config[:deploy_repo_name]}.git"
	deploy.build_before = true
  deploy.commit_message = "Automated deploy at #{Time.now}"
end

# activate :google_analytics do |ga|
#   ga.tracking_id = 'UA-76972340-1'
#   ga.domain_name = 'somedomain.com'
#   ga.enhanced_link_attribution = true
#   ga.development = false
# end
