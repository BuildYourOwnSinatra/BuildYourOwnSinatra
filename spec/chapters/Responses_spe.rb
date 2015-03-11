describe "Chapter:Responses" do
	it "should cover Rack:Response" do
		$content['chapter_responses']['has_rack_response'].should equal true
	end

	describe "Section:Rack Response" do
		it "should cover how Rack::Response simply responds to each" do
			$content['chapter_responses']['rack_response']['responds_to_each'].should equal true
		end

		it "should cover how it is is just a wrapper around responses codes and headers" do
			$content['chapter_responses']['rack_response']['just_a_wrapper'].should equal true
		end

		it "should cover the array access methods for accessing and setting headers" do
			$content['chapter_responses']['rack_response']['array_access'].should equal true
		end

		it "should cover error setting methods" do
			$content['chapter_responses']['rack_response']['cover_errors'].should equal true
		end

		it "should cover how errors are just headers" do
			$content['chapter_responses']['rack_response']['errors_are_just_headers'].should equal true
		end

		it "should show how to set errors manually" do
			$content['chapter_responses']['rack_response']['errors_manually'].should equal true
		end

		it "should mention how it calculates length for us" do
			$content['chapter_responses']['rack_response']['calculates_length'].should equal true
		end

		it "should cover how at the end all these details are turned into the array format Rack wants by calling finish" do
			$content['chapter_responses']['rack_response']['finish_call'].should equal true
		end

 		it "should mention how implicit to_ary is aliased to finish" do
			$content['chapter_responses']['rack_response']['mention_to_ary'].should equal true
 		end

	 	it "should mention how sessions and cookies are set" do
			$content['chapter_responses']['rack_response']['mention_session_handling'].should equal true
	 	end

	 	it "should plant the idea that sessions, locations, errors, cookies and everything are just headers" do
			$content['chapter_responses']['rack_response']['everything_is_a_header'].should equal true
	 	end
	end

 	it "should cover how sinatra handle's responses" do
		$content['chapter_responses']['has_sinatra'].should equal true
 	end

 	describe "Section:Sinatra" do
		it "should cover how Sinatra::Response basically makes it easier to set body stuff" do
			$content['chapter_responses']['sinatra']['easier_body'].should equal true
		end

		it "should show most stuff handled in helper methods" do
			$content['chapter_responses']['sinatra']['helper_methods'].should equal true
		end

		it "should show how that error handling is basically a convenience method that pulls response ints from a hash" do
			$content['chapter_responses']['sinatra']['error_handling'].should equal true
		end

		it "should show that other errors are just raw Ruby exceptions that are caught and mapped to something meaningful" do
			$content['chapter_responses']['sinatra']['raw_errors'].should equal true
		end
 	end

 	it "should briefly go over how responses are just a string and headers to tell the browser what to do" do
		$content['chapter_responses']['just_string_and_headers'].should equal true
 	end

 	it "should mention bonus chapter" do
		$content['chapter_responses']['mention_bonus'].should equal true
 	end

 	it "should go over why I haven't covered session handling, caching and cookies etc. everything is just a header" do
 		$content['chapter_responses']['cookies_absence'].should equal true
 	end

 	it "should cover hows errors can just be raw Ruby exceptions" do
 		$content['chapter_responses']['raw_ruby_exceptions'].should equal true
 	end

 	it "should have a quick example on how to set some cookies, sessions and cached headers" do
		$content['chapter_responses']['quick_examples'].should equal true
 	end

 	it "should have a quick example of raw Ruby errors being caught" do
		$content['chapter_responses']['raw_ruby_exceptions_example'].should equal true
 	end

 	it "should make a reader want to build the whole thing" do
		$content['chapter_responses']['make_reader_want_to_build_the_whole_thing'].should equal true
 	end
end
