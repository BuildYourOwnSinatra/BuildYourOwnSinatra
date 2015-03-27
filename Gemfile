source "https://rubygems.org"
ruby '2.1.5'

gem 'puma',           '2.11.0'
gem 'rake',           '10.4.2'

gem 'activesupport', '4.1.9'

group :app do
  gem 'rack-contrib'
  gem 'rack-robustness'
  gem 'mime-types'
  gem 'eldr',           github: 'eldr-rb/eldr'
  gem 'eldr-action',    github: 'eldr-rb/eldr-action'
  gem 'eldr-rendering', github: 'eldr-rb/eldr-rendering'
  gem 'eldr-sessions'
  gem 'eldr-assets'
  gem 'eldr-responders', github: 'eldr-rb/eldr-responders'

  gem 'omniauth-github',   '1.1.2'
  gem 'moneta',            '0.8.0'
  gem 'require_all',       '1.3.2'
  gem 'build-your-own-sinatra', github: 'BuildYourOwnSinatra/build-your-own-sinatra.gem'
end

gem 'foreman'
gem 'middleman',      '3.3.7'
gem 'middleman-blog', '3.5.3'
gem 'nokogiri',       '1.6.6.2'
gem 'gepub',          '0.6.9.2'
gem 'pdfkit',         '0.6.2'
gem 'bourbon',        '3.2.4'
gem 'slim',           '3.0.1'
gem 'kramdown',       '1.5.0'
gem 'github_api', '0.12.3'
gem 'rouge', '1.8.0'

group :test do
  gem 'rspec',            '3.1.0'
  gem 'rubocop',          '0.28.0'
  gem 'rack-test',        '0.6.2'
  gem 'ffaker',           require: 'ffaker'
  gem 'factory_girl'
  gem 'rspec-html-matchers', github: 'kucaahbe/rspec-html-matchers'
  gem 'shoulda-matchers'
end
