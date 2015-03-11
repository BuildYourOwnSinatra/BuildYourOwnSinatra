describe "Chapter:MVC With Only Rack" do
	it "should go over what we will be build" do
		$content['chapter_mvc']['intro'].should equal true
	end

	it "should go over laying the foundations" do
		$content['chapter_mvc']['has_foundations'].should equal true
	end

	describe "foundations" do
		it "should go over the architecture" do
			$content['chapter_mvc']['foundations']['architecture'].should equal true
		end

		it "should go over testing" do
			$content['chapter_mvc']['foundations']['testing'].should equal true
		end

		it "should go over autoloading and configuration" do
			$content['chapter_mvc']['foundations']['configuration'].should equal true
		end
	end

	it "should go over how our app/dispatcher main class is just a rack app" do
		$content['chapter_mvc']['app_is_just_rack'].should equal true
	end

	it "should go over how we can just put routes in a hash" do
		$content['chapter_mvc']['routes_hash'].should equal true	
	end

	it "should go over how the controllers are just maps in a hash" do
		$content['chapter_mvc']['controllers_just_maps'].should equal true
	end

	it "should go over controller base class" do
		$content['chapter_mvc']['controller_base_class'].should equal true
	end

	describe "putting it all together" do
		it "should have tests for everything" do
			$content['chapter_mvc']['all_together']['has_tests'].should equal true
		end

		it "should go over configuration and autoloading" do
			$content['chapter_mvc']['all_together']['config'].should equal true
		end

		it "should go over the app class" do
			$content['chapter_mvc']['all_together']['app'].should equal true
		end

		it "should go over the controllers" do
			$content['chapter_mvc']['all_together']['controllers'].should equal true
		end

		it "should go over views" do
		$content['chapter_mvc']['all_together']['has_views'].should equal true
		end
	end
  
  describe "views" do
		it "should go over the render method" do
			$content['chapter_mvc']['views']['has_rendering'].should equal true
		end

		describe "rendering" do
			it "should go over raw strings" do
				$content['chapter_mvc']['views']['rendering']['raw'].should equal true
			end
			
			it "should go over tilt and mention how easy the abstraction is" do
				$content['chapter_mvc']['views']['rendering']['tilt'].should equal true
			end
		end
  end

	it "should make reader want to build routes" do
		$content['chapter_mvc']['make_reader_want_to_build_routes'].should equal true
	end
end
