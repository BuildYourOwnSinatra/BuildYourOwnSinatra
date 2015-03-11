require 'yaml'
$content = YAML.load_file(File.expand_path("./content_definitions.yml", File.dirname(__FILE__)))

ENV['RACK_ENV']   = 'test'
ENV['SESSION_ID'] = 'test'
ENV['GITHUB_RELEASES_URL'] = 'https://github.com/BuildYourOwnSinatra/BuildYourOwnSinatra/releases'
ENV['GITHUB_USER'] = 'BuildYourOwnSinatra'
ENV['MONGO_URI'] = 'mongodb://localhost:27017/byos'
ENV['REDIS_URL'] = 'redis://127.0.0.1:6379/0'
ENV['REDIS_NAMESPACE'] = 'byos:sessions'

require 'build-your-own-sinatra'
require 'ffaker'
require 'factory_girl'
Bundler.require :test

FactoryGirl.definition_file_paths = [
  File.join(File.dirname(__FILE__), 'factories')
]
FactoryGirl.find_definitions

def gen_omniauth_hash
  OmniAuth::AuthHash.new({
    :provider => 'github',
    :uid      => Faker::Internet.user_name.gsub('.','') + rand(0...1000).to_s,
    :info     => {
      :email    => "#{Faker::Internet.user_name}_#{rand(0...1000)}@example.org",
      :nickname => 'hurley'
    }
    })
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = gen_omniauth_hash

def clean_db
  Identity.destroy_all
  Package.destroy_all
  Purchase.destroy_all
  User.destroy_all
end

clean_db

module GlobalConfig
  extend RSpec::SharedContext

  let(:app) do
    path = File.expand_path("../config.ru", File.dirname(__FILE__))
    Rack::Builder.parse_file(path).first
  end
end

# Hardcode an instance into a global because rack-test likes to get too clever
RSpec.configure do |config|
  config.include GlobalConfig
  config.include Rack::Test::Methods
  config.include RSpecHtmlMatchers
  config.pattern = '**{,/*/**}/*_spec.rb'
end
