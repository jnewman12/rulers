require_relative "test_helper" #require, but check from this file's directory not the load path

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
	include Rack::Test::Methods

	def app 
		TestApp.new
	end

	def test_request
		get "/"

		assert last_response.ok?
		body = last_response.body
		assert body['Hello']
	end
end