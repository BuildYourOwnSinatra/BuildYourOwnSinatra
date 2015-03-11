describe "Chapter: Putting It All Together" do
	it "should loop back to the beginning" do
		$content['chapter_finish']['has_loop'].should equal true
	end

	it "should lay the foundations" do
		$content['chapter_finish']['has_foundations'].should equal true
	end

 	describe "Foundations" do 
 		it "should cover testing" do
	 		$content['chapter_finish']['foundations']['testing'].should equal true
 		end

 		it "should go over reloading" do
 			$content['chapter_finish']['foundations']['reloading'].should equal true
 		end

 		it "should cover how Rack::Reload works" do
			$content['chapter_finish']['foundations']['rack_reload'].should equal true
 		end
	end

	it "should cover a Request class" do
		$content['chapter_finish']['has_request'].should equal true
	end

	describe "Request" do
		it "should go over our needs" do
			$content['chapter_finish']['request']['needs'].should equal true
		end

		it "should go over how we want to be able build powerful parameter validators" do
			$content['chapter_finish']['request']['want_power_in_future'].should equal true
		end

		it "should go over params parser" do
			$content['chapter_finish']['request']['params_parser'].should equal true
		end

		it "should have tests" do
			$content['chapter_finish']['request']['tests'].should equal true
		end
	end

	it "should cover a Response class" do
		$content['chapter_finish']['has_response'].should equal true
	end

	describe "Response" do
		it "should cover how simple render can be" do
			$content['chapter_finish']['response']['simple_render'].should equal true
		end

		it "should cover how we leave rendering up mostly to formatter classes or tilt" do
			$content['chapter_finish']['response']['leave_it_to_tilt'].should equal true
		end

		it "should have tests" do
			$content['chapter_finish']['response']['tests'].should equal true
		end
	end

	it "should cover a Router" do
		$content['chapter_finish']['has_router'].should equal true	
	end

	describe "Router" do
		it "should re-hash route types class vs blocks" do
			$content['chapter_finish']['router']['rehash_class_vs_blocks'].should equal true
		end

		it "should cover the best of both worlds named routes" do
			$content['chapter_finish']['router']['named_routes'].should equal true
		end

		it "should cover conditions" do
			$content['chapter_finish']['router']['conditions'].should equal true
		end

		it "should cover how conditions are just key value pairs" do
			$content['chapter_finish']['router']['conditions_kv'].should equal true
		end

		it "should cover that Routes are just simple struct objects" do
			$content['chapter_finish']['router']['routes_structs'].should equal true
		end

		it "should cover how we push the Router onto our app class" do
			$content['chapter_finish']['router']['router_app'].should equal true
		end

		it "should have tests" do
			$content['chapter_finish']['router']['tests'].should equal true
		end
	end

	it "should cover an app class" do
		$content['chapter_finish']['has_app'].should equal true
	end

	it "should cover how everything should be an app class so it can dispatch, route, extend and chain" do
		$content['chapter_finish']['big_app'].should equal true
	end

	it "should mention bonus chapter on streaming" do
		$content['chapter_finish']['mention_bonus'].should equal true
	end

	it "should cover building app/controller class" do
		$content['chapter_finish']['app_controller'].should equal true
	end

	describe "Section:App Controller" do
		it "should compare classes vs blocks" do
			$content['chapter_finish']['app']['classes_vs_blocks'].should equal true
		end

		it "should try to get the best of both worlds via name routes on class methods" do
			$content['chapter_finish']['app']['best_of_both'].should equal true
		end

		it "should cover how to incorporate the Router" do
			$content['chapter_finish']['app']['incorporating_router'].should equal true
		end

		it "should cover incorporating our Request and Response classes" do
			$content['chapter_finish']['app']['incorporating_request_and_response'].should equal true
		end

		it "should have tests" do
			$content['chapter_finish']['app']['has_tests'].should equal true
		end
	end

	it "should cover helpers" do
		$content['chapter_finish']['has_helpers'].should equal true
	end

	it "should cover how helpers can just be modules" do
		$content['chapter_finish']['helpers_can_be_modules'].should equal true
	end

	it "should cover quick helpers example" do
		$content['chapter_finish']['helpers_example'].should equal true
	end

	it "should cover a quick configuration/autoloading architecture" do
		$content['chapter_finish']['autoloading'].should equal true
	end

	it "should go over everything again together" do
		$content['chapter_finish']['review'].should equal true
	end

  it "should have tests" do
		$content['chapter_finish']['has_tests'].should equal true
  end

  it "should cover packaging and distributing" do
		$content['chapter_finish']['packaging'].should equal true
  end

  it "should reference a github repo" do
		$content['chapter_finish']['github_repo_reference'].should equal true
  end

  it "should talk about so then how do we use this?" do
		$content['chapter_finish']['wat'].should equal true
  end

  it "should have a quick a app example that loops back around in a funny way" do
		$content['chapter_finish']['quick_example'].should equal true
  end

  it "should end with my signature" do
  	$content['chapter_finish']['has_sig'].should equal true
  end

  it "should reference everything again" do
		$content['chapter_finish']['github_references_repeat'].should equal true
  end
end
