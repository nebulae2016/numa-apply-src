require 'httparty'
require 'awesome_print'

api_url = 'https://circleci.com/api/v1/project/nebulae2016/numa-apply-src?circle-token=68f59bce554a73053030d5bf418d5779eeba364c'

response = HTTParty.post(
	api_url, 
	:headers => { 'Content-Type' => 'application/json' },
	:build_parameters => { :location => 'bangalore' }.to_json
)

ap response
