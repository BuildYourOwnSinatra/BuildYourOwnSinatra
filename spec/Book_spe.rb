describe "Book" do
	it "should have a title" do
		$content['has_title'].should equal true
	end

	it "should have a table of contents" do
		$content['has_toc'].should equal true
	end

	it "should have an introduction" do
		$content['has_introduction'].should equal true
	end

	describe "Chapters" do
		it "should have a chapter on Rack" do
			$content['chapters']['rack'].should equal true
		end

		it "should have a chapter on building a router" do
			$content['chapters']['router'].should equal true
		end

		it "should have a chapter on requests" do
			$content['chapters']['requests'].should equal true
		end

		it "should have a chapter on responses" do
			$content['chapters']['responses'].should equal true
		end

    # Decided against it
		# it "should have a chapter on session handling" do
		# 	$content['chapters']['state'].should equal true
		# end

		it "should have a chapter that reviews sinatra's architecture" do
			$content['chapters']['review_sinatra'].should equal true
		end

		it "should have a chapter on structuring the framework" do
			$content['chapters']['structuring'].should equal true
		end

		it "should have a chapter on bringing it all together" do
			$content['chapters']['wrap_up'].should equal true
		end
	end

	it "should have bonus chapters" do
		$content['has_bonus_chapters'].should equal true
	end

	describe "Bonus Chapters" do
		it "should have a bonus chapter on building a grape like dsl for parameters" do
			$content['bonus_chapters']['grape'].should equal true
		end

		it "should have a bonus chapter on building rack middleware" do
			$content['bonus_chapters']['building_rack_middleware'].should equal true
		end

		it "should have a bonus chapter on rack streaming" do
			$content['bonus_chapters']['rack_streaming'].should equal true
		endq

		it "should have bonus chapter on structuring big apps as little pieces" do
			$content['bonus_chapters']['pieces'].should equal true
		end

		it "should have a bonus chapter on securing frameworks" do
			$content['bonus_chapters']['securing'].should equal true
		end

		it "should have a bonus chapter on reversing the rack direction. rack as a client" do
			$content['bonus_chapters']['reversing_rack'].should equal true
		end
 	end
end
