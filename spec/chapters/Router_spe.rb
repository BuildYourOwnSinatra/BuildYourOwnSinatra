describe "Chapter:Router" do
	it "should show that it is just an app call" do
		$content['chapter_router']['just_app_call'].should equal true
	end

	it "should go over a very simple router" do
		$content['chapter_router']['has_simple_router'].should equal true
	end

	describe "Section:Simple Router" do
		it "should explain at its core that it is just matching on REQUEST_METHOD and then PATH_INFO" do
			$content['chapter_router']['simple_router']['explains_core'].should equal true
		end

		it "should go over a block route" do
			$content['chapter_router']['simple_router']['block_route'].should equal true
		end

		it "should provide some tests for block route" do
			$content['chapter_router']['simple_router']['block_route_tests'].should equal true
		end

		it "should go over a object + method route" do
			$content['chapter_router']['simple_router']['object_route'].should equal true
		end

		it "should provide some tests for object + method route" do
			$content['chapter_router']['simple_router']['object_route_tests'].should equal true
		end

		it "should go over basic parameter parsing" do
			$content['chapter_router']['simple_router']['parameter_parsing'].should equal true
		end

		it "should make reader want to learn about sinatra routing" do
			$content['chapter_router']['simple_router']['make_reader_want_to_learn_about_sinatra_routing'].should equal true
		end
	end

	it "should go over how sinatra works its routes" do
		$content['chapter_router']['has_sinatra'].should equal true
	end

	describe "Section:Sinatra" do
		it "should describe how individual sinatra apps are just rack apps" do
			$content['chapter_router']['sinatra']['just_rack'].should equal true
		end

		it "should describe how everything in sinatra is basically pushed into one big app instance" do
			$content['chapter_router']['sinatra']['one_big_instance'].should equal true
		end

		it "should go over the path a response takes through sinatra" do
			$content['chapter_router']['sinatra']['has_sinatra_cycle'].should equal true
		end

		describe "Sinatra Cycle" do
			it "should describe call!" do
				$content['chapter_router']['sinatra']['cycle']['call'].should equal true
			end

			it "should go over how call just pulls from class values request, response and body" do
				$content['chapter_router']['sinatra']['cycle']['call_gets_from_instance_vars'].should equal true
			end

			it "should go over dispatch!" do
				$content['chapter_router']['sinatra']['cycle']['dispatch'].should equal true
			end

			it "should go over static!" do
				$content['chapter_router']['sinatra']['cycle']['static'].should equal true
			end

			it "explain invoke" do
				$content['chapter_router']['sinatra']['cycle']['has_invoke'].should equal true
			end

			describe "invoke" do
				it "should describe how invoke wraps the response of a routed block into body" do
					$content['chapter_router']['sinatra']['invoke']['explain'].should equal true
				end

				it "should go over route!" do
					$content['chapter_router']['sinatra']['invoke']['route'].should equal true
				end

				it "should go over that routes in sinatra are blocks + patter pushed onto hash keyed by request method" do
					$content['chapter_router']['sinatra']['invoke']['routes_are_blocks'].should equal true
				end

				it "should go over filter!" do
					$content['chapter_router']['sinatra']['invoke']['filter'].should equal true
				end

				it "should explain filters just set stuff on the app" do
					$content['chapter_router']['sinatra']['invoke']['filters_set_instance_vars'].should equal true
				end
			end
		end

		it "should make reader realize sinatra is meant to be self-contained as it is not designed to be clean and modular" do
			$content['chapter_router']['sinatra']['self_contained'].should equal true
		end

		it "should mention how we could split sinatra stuff up" do
			$content['chapter_router']['sinatra']['make_modular'].should equal true
		end

		it "should make reader want to improve on sinatra" do
			$content['chapter_router']['sinatra']['make_reader_want_to_improve_on_sinatra'].should equal true
		end
	end

	describe "Section: Building our Router/Putting It All Together" do
		it "should go over the architectures for routing" do
			$content['chapter_router']['building']['has_architecture'].should equal true
		end

		describe "architectures" do
			it "should go over rails" do
				$content['chapter_router']['building']['architecture']['rails'].should equal true
			end

			it "should go over sinatra" do
				$content['chapter_router']['building']['architecture']['sinatra'].should equal true
			end

			it "should go over racky" do
				$content['chapter_router']['building']['architecture']['rack'].should equal true
			end
		end

		it "should show how to build a Router" do
			$content['chapter_router']['building']['has_router'].should equal true
		end

		describe "Router" do
			it "should go over priority" do
				$content['chapter_router']['building']['router']['priority'].should equal true
			end

			it "should go over sinatra's route!" do
				$content['chapter_router']['building']['router']['route'].should equal true
			end

			it "should go over defer" do
				$content['chapter_router']['building']['router']['defer'].should equal true
			end

			it "should have tests" do
				$content['chapter_router']['building']['router']['has_tests'].should equal true
			end
		end

		it "should go over a route class" do
			$content['chapter_router']['building']['has_route'].should equal true
		end

		it "should go over pattern matching" do
			$content['chapter_router']['building']['has_pattern_matching'].should equal true
		end

		describe "Pattern Matching" do
			it "should go over priority" do
				$content['chapter_router']['building']['pattern_matching']['priority'].should equal true
			end

			it "should go over splats" do
				$content['chapter_router']['building']['pattern_matching']['splats'].should equal true
			end
		end

		it "should go over it all together" do
			$content['chapter_router']['building']['overview'].should equal true
		end

		it "should have tests" do
			$content['chapter_router']['building']['has_tests'].should equal true
		end

		it "should make the reader realize the failure of simple parameter parsing" do
			$content['chapter_router']['building']['make_reader_realize_failure_of_simple_param_parsing'].should equal true
		end
	end

	it "should make reader want to learn about requests" do
		$content['chapter_router']['make_reader_want_to_learn_about_requests'].should equal true
	end
end
