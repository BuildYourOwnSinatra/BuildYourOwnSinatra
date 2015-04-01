describe 'App' do
  describe 'GET /' do
    context 'logged in' do
      it 'returns all available chapters' do
        response = get '/'
        expect(response.body).to have_tag('li.chapter.available.introduction')
        expect(response.body).to have_tag('li.chapter.available.responses')
      end
    end
  end

  describe 'GET /download' do
    let(:user) { FactoryGirl.create(:user_with_purchases) }

    it 'redirects to GitHub releases page' do
      get '/download', nil, {'rack.session' => { "#{ENV['SESSION_ID']}" => user.id }}
      expect(last_response.status).to eq(303)
      expect(last_response.headers['Location']).to eq(ENV['GITHUB_RELEASES_URL'])
    end
  end

  describe 'GET /downloads/screencasts/:slug' do
    let(:screencast) { FactoryGirl.create(:screencast) }

    context 'user has screencast permissions' do
      let(:user) { FactoryGirl.create(:user_with_screencast_package) }
      let(:screencast) do
        screencast = FactoryGirl.create(:screencast)
        package = user.package
        package.screencasts << screencast
        package.save
        screencast
      end

      it 'redirects to the screencast' do
        get "/downloads/screencasts/#{screencast.slug}", nil, {'rack.session' => { "#{ENV['SESSION_ID']}" => user.id }}
        expect(last_response.status).to eq(303)
        expect(last_response.headers['Location']).to eq(screencast.file_url)
      end
    end
  end

  context 'GET /chapters/:slug' do
    context 'when chapter does not exist' do
      it 'returns NotFound' do
        get '/chapters/bob'
        expect(last_response.status).to eq 404
      end
    end

    context 'when chapter exists' do
      it 'returns the chapter' do
        get '/chapters/responses.html'
        expect(last_response.status).to eq(200)
      end
    end
  end
end
