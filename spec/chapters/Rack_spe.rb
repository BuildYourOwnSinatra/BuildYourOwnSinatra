describe "Chapter:Rack" do
	it "should tell the story of rack" do
		$content['chapter_rack']['story'].should equal true
	end

	it "should loop back to example" do
		$content['chapter_rack']['has_loop'].should equal true
	end

	it "should maintain a theme so we can loop" do # maybe cats?
		$content['chapter_rack']['has_theme'].should equal true
	end

	describe "Section:Simplest Rack App" do
		it "show how to do hello world" do
			$content['chapter_rack']['simplest']['hello'].should equal true
		end

		it "should describe the basic nature of request and response code and string" do
			$content['chapter_rack']['simplest']['structure'].should equal true
		end

		it "should describe how rack just wants an iterator back" do
			$content['chapter_rack']['simplest']['iterator'].should equal true
		end

		it "should describe how it is needed for streaming" do
			$content['chapter_rack']['simplest']['streaming'].should equal true
		end

		it "should mention bonus chapter on Rack streaming" do # hey that could our next book building streaming stuff
			$content['chapter_rack']['simplest']['reference_streaming'].should equal true
		end

		it "should cover how to boot an app using rack manually" do 
			$content['chapter_rack']['simplest']['boot_manually'].should equal true
		end

		it "should cover how to boot an app using rackup-" do 
			$content['chapter_rack']['simplest']['boot_using_rackup'].should equal true
		end

		it "should lead into how rack chains together" do
			$content['chapter_rack']['simplest']['chaining'].should equal true
		end
	end

	it "should describe how middleware works" do
		$content['chapter_rack']['middleware_works'].should equal true
	end

	describe "Section:Middleware" do
		it "should show a simple example of how to append a string to the response" do
			$content['chapter_rack']['middleware']['append'].should equal true
		end

		it "should show it is chains all the way" do
			$content['chapter_rack']['middleware']['chains_all_the_way'].should equal true
		end

		it "should have an example of two simple middleware chained together" do
			$content['chapter_rack']['middleware']['chain_example'].should equal true
		end

		it "should describe how rack middleware and apps are essentially the same" do
			$content['chapter_rack']['middleware']['apps_and_middleware'].should equal true
		end

		it "should have an example of middleware and an app working together" do
			$content['chapter_rack']['middleware']['example'].should equal true
		end
	end

	it "should plant the idea of building MVC with only rack" do
		$content['chapter_rack']['plant_idea'].should equal true
	end

	describe "Section:Inside The Env Object" do
		it "should introduce the env request/responses and go over how most of what we use is just abstraction over that" do
			$content['chapter_rack']['env']['just_abstraction'].should equal true
		end

		it "should go over requests" do
			$content['chapter_rack']['env']['has_requests'].should equal true
		end

		it "should go over responses" do
			$content['chapter_rack']['env']['has_responses'].should equal true
		end

		describe "Requests" do
			it "should go over requests are just an object that gets passed around so we can mess with it all we like" do
				$content['chapter_rack']['env']['requests']['just_an_object'].should equal true
			end

			it "should go over how must of our fancy framework Request stuff works" do
				$content['chapter_rack']['env']['requests']['inside_fancy'].should equal true
			end
		end

		describe "Responses" do
			it "should go over that responses are just objects that can go iterate and return to_s" do
				$content['chapter_rack']['env']['responses']['iterate'].should equal true
			end

			it "should go over how to construct responses using a class object" do
				$content['chapter_rack']['env']['responses']['howto_class_object'].should equal true
			end

			it "should go over how must of our fancy framework Response stuff works" do
				$content['chapter_rack']['env']['responses']['inside_fancy'].should equal true
			end
		end

		it "make them want to build mvc with only rack" do
			$content['chapter_rack']['env']['make_them_want_to_build_with_rack'].should equal true
		end
	end
end
