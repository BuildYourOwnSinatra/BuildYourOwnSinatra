describe "Hook" do
	it "should start the story (You)" do
		$content['hook']['story'].should equal true
	end

	it "should burn the tongue (You/Need)" do
		$content['hook']['burnt_tongue'].should equal true
	end

	it "should start the reader in a situation (Need)" do
		$content['hook']['reader_in_situation'].should equal true
	end

	it "should make the reader want to build a ruby framework (Go)" do
		$content['hook']['reader_want_to_build_ruby_framework'].should equal true
	end
end
