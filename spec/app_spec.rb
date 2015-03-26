describe 'App' do
  describe 'GET /' do
    context 'logged in' do
      let(:user) { FactoryGirl.create(:user_with_purchases) }

      it 'returns all available chapters' do
        allow_any_instance_of(User).to receive(:can_read_chapter?).and_return(true)
        response = get '/', nil, {'rack.session' => { "#{ENV['SESSION_ID']}" => user.id }}
        expect(response.body).to have_tag('li.chapter.available.introduction')
        expect(response.body).to have_tag('li.chapter.available.responses')
      end
    end

    context 'logged out' do
      it 'returns excerpt chapters' do
        response = get '/'
        expect(response.body).to have_tag('li.chapter.available.introduction')
        expect(response.body).to have_tag('li.chapter.unavailable.responses')
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

    context 'not logged in' do
      it 'returns not authorized' do
        get "/downloads/screencasts/#{screencast.slug}"
        expect(last_response.status).to eq 401
      end
    end

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

    context 'user has no screencast permissions' do
      let(:user) { FactoryGirl.create(:user) }
      let(:screencast) { FactoryGirl.create(:screencast) }

      it 'returns an upgrade page' do
        get "/downloads/screencasts/#{screencast.slug}", nil, {'rack.session' => { "#{ENV['SESSION_ID']}" => user.id }}
        expect(last_response.status).to eq 401
      end
    end
  end

  context 'GET /chapters/:slug' do
    context 'when logged in' do
      context 'and chapter does not exist' do
        it 'returns NotFound' do
          get '/chapters/bob'
          expect(last_response.status).to eq 404
        end
      end

      context 'and allowed to read chapter' do
        let(:user) { FactoryGirl.create(:user) }

        it 'returns the chapter' do
          allow_any_instance_of(User).to receive(:can_read_chapter?).and_return(true)
          allow_any_instance_of(User).to receive(:package).and_return(true)
          get '/chapters/responses', nil, {'rack.session' => { "#{ENV['SESSION_ID']}" => user.id }}
          expect(last_response.status).to eq(200)
        end
      end

      context 'and not allowed to read chapter' do
        let(:user) { FactoryGirl.create(:user) }

        it 'returns an upgrade page' do
          allow_any_instance_of(User).to receive(:package).and_return(nil)
          get '/chapters/mvc-on-rack', nil, {'rack.session' => { "#{ENV['SESSION_ID']}" => user.id }}
          expect(last_response.status).to eq(303)
          expect(last_response.location).to eq('/upgrade')
        end
      end
    end
  end
end
