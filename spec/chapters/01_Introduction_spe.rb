describe 'Introduction' do
  let(:intro) { $content['introduction'] }

  it 'describes how the book came to be' do
    expect(intro['has_origin']).to eq(true)
  end

  it 'has a hook' do
    expect(intro['has_hook']).to eq(true)
  end

  describe 'hook' do
    it 'tells the story of the horrible helpers' do
      expect(intro['hook']['horrible_helpers']).to eq(true)
    end
  end

  it 'describes how the book is organized' do
    expect(intro['has_how_book_is_organized_section']).to eq(true)
  end

  describe 'Section:How This Book is Organized' do
    let(:content) { intro['how_this_book_is_organized'] }

    it 'describes main layout of chapter followed by tests then sub chapters' do
      expect(content['describes_layout']).to eq(true)
    end

    it 'shows notes' do
      expect(content['has_notes']).to eq(true)
    end

    it 'shows tips/warnings' do
      expect(content['has_tips_and_warnings']).to eq(true)
    end

    it 'shows live commits' do
      expect(content['has_live_commits']).to eq(true)
    end
  end

  it 'describes what we will build' do
    expect(intro['has_what_we_will_build_section']).to eq(true)
  end

  describe 'Section:What We Will Build' do
    let(:content) { $content['introduction']['what_we_will_build'] }

    it 'describes eldr' do
      expect(content['describes_eldr']).to eq(true)
    end

    it 'mentions how eldr helpers are just modules' do
      expect(content['eldr_helpers_are_just_modules']).to eq(true)
    end
  end
end
