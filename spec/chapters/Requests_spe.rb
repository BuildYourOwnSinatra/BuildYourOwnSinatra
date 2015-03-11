describe "Chapter:Requests" do
	it "should have an intro" do
		$content['chapter_requests']['intro'].should equal true
	end

	it "should go over rack_request" do
		$content['chapter_requests']['has_rack_request'].should equal true
	end

	describe "Rack Request" do
		it "should describe how methods map to the request env" do
			$content['chapter_requests']['rack_request']['env'].should equal true
		end

		it "should go over how Rack::Request isn't essential and essentially is just wrapper around env" do
			$content['chapter_requests']['rack_request']['wrapper'].should equal true
		end

		it "should mention how Sinatra::Request and Rails ActionDispatch::Request simply extends Rack::Request" do
			$content['chapter_requests']['rack_request']['sinatra_and_rails_extend_rack'].should equal true
		end

		it "should show how we could pop in another Request class because it just takes env" do
			$content['chapter_requests']['rack_request']['pop_in'].should equal true
		end

 		it "should show how to extend Rack::Request" do
 			$content['chapter_requests']['rack_request']['extending'].should equal true
 		end
	end

	it "should go over how Sinatra::Request simply extends Rack::Request" do
		$content['chapter_requests']['has_sinatra_request'].should equal true
	end

	describe "Sinatra::Request" do
		it "should have an intro" do
			$content['chapter_requests']['sinatra_request']['intro'].should equal true
		end

		it "should show how Sinatra::Request.new() is simply passed an env" do
			$content['chapter_requests']['sinatra_request']['sinatra_request_gets_an_env'].should equal true
		end

		it "should go over how the pretty much the only thing it does is parse the acceptance headers" do
			$content['chapter_requests']['sinatra_request']['sinatra_request_parses_acceptance_headers'].should equal true
		end
	end


	it "should show how to build an advanced param parser/validator" do
		$content['chapter_requests']['has_advanced_parameters'].should equal true
	end

	describe "building a parameters validator" do
		it "should describe what we want to build" do
			$content['chapter_requests']['advanced_parameters']['intro'].should equal true
		end

		it "should show that it is easily done by just extending Rack::Request and setting params to a hashie like model class" do
			$content['chapter_requests']['advanced_parameters']['extending'].should equal true
		end

		it "should show that once we have have params as model like stuff we can use params like virtus/active record" do
			$content['chapter_requests']['advanced_parameters']['params_like_activerecord'].should equal true
		end

		it "should show how to use validators gem with parameters as module attributes" do
			$content['chapter_requests']['advanced_parameters']['params_validations'].should equal true
		end

		it "should show that error handling is just a matter of hooking filters that check params/mode.errors?" do
			$content['chapter_requests']['advanced_parameters']['error_handling'].should equal true
		end

		it "should show how this leads us to need to know a bit about responses" do
			$content['chapter_requests']['advanced_parameters']['lead_to_responses'].should equal true
		end
	end

	it "should ask what about responses?" do
		$content['chapter_requests']['what_about_responses'].should equal true
	end

  it "should make the reader want to read about responses" do
  	$content['chapter_requests']['make_reader_want_to_learn_about_responses'].should equal true
  end
end
