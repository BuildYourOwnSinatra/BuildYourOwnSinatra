describe "More Complex Middleware" do
	it "should loop back and introduce concept of chaining" do
		$content['chapter_rack']['more_complex_middleware']['loop_back_to_chaining'].should equal true
	end

	it "should introduce the concept of hooking" do
		$content['chapter_rack']['more_complex_middleware']['hooking'].should equal true
	end

	it "should go over rack builder and building things together" do
		$content['chapter_rack']['more_complex_middleware']['builder'].should equal true
	end

	it "should reference security bonus chapter" do
		$content['chapter_rack']['more_complex_middleware']['reference_security_bonus'].should equal true
	end

	it "should go over how sprockets operates" do
		$content['chapter_rack']['more_complex_middleware']['sprockets'].should equal true
	end

	describe "Building our own assets system" do
		it "should introduce what we are building" do
			$content['assets_middleware']['intro'].should equal true
		end

		it "should go over file system elements" do
			$content['assets_middleware']['has_files'].should equal true
		end

		describe "Files" do
			it "should go over loading files" do
				$content['assets_middleware']['files']['loading'].should equal true
			end

			it "should go over confident ruby style to_path stuff" do
				$content['assets_middleware']['files']['to_path'].should equal true
			end

			it "should go over file busting" do
				$content['assets_middleware']['files']['busting'].should equal true
			end

			it "should go over locating the files" do
				$content['assets_middleware']['files']['locating'].should equal true
			end
		end

		it "should go over caching" do
			$content['assets_middleware']['caching'].should equal true
		end

		it "should go over hooking into the rack systems" do 
			$content['assets_middleware']['hooking'].should equal true
		end
	end
end
