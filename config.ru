require 'bundler'
require 'middleman-blog'
require 'sprockets'
require 'eldr'
require 'eldr/assets'
require 'eldr/sessions'
require 'eldr/rendering'
require 'eldr/responders'
require 'rack/session/moneta'
require 'rack/robustness'
require 'build-your-own-sinatra'
require_relative 'lib/tidy'
require_relative 'lib/helpers'
require_relative 'lib/app_helpers'

Bundler.require :app

class NotAuthorized < StandardError
  def call(_env)
    Rack::Response.new message, 401
  end
end

class NotFound < StandardError
  def call(_env)
    Rack::Response.new message, 404
  end
end

class App < Eldr::App
  # Catch Explosions of the worst kind
  use Rack::Robustness do |g|
    g.status 500
    g.content_type 'text/plain'
    g.body 'Sorry, my backend exploded! Mention me (@k_2052) and let me know!'
  end

  include Helpers
  include AppHelpers
  include Eldr::Rendering
  include Eldr::Sessions
  include Eldr::Responders
  include Eldr::Assets

  uri = URI.parse(ENV['MONGODB_URI'])
  use Rack::Session::Moneta, store: Moneta.new(:Mongo, {
    :host     => uri.host,
    :port     => uri.port,
    :db       => uri.path.gsub(/^\//, ''),
    :user     => uri.user,
    :password => uri.password,
  })
  set :views_dir,  File.join(__dir__, 'source')
  set :public_dir, File.join(__dir__, 'build', 'html')

  use Rack::Static,
    :urls => ['/images', '/js', '/css'],
    :root => File.join(__dir__, 'build', 'html')

  def middleman
    app ||= ::Middleman::Application.server.inst
  end

  def redirect_to(path)
    resp = Rack::Response.new '', 303
    resp['Location'] = path
    resp
  end

  before(:screencast, :download) do
    unless signed_in?
      @message = 'Not Logged In'
      raise NotAuthorized, Tilt.new(find_template('error.html.slim')).render(self)
    end
  end

  before(:screencast, :download) do
    @package = current_user.package
    raise NotAuthorized, 'Did you not purchase the book?' unless @package
  end

  get '/' do
    if signed_in?
      send_file 'full.html'
    else
      send_file 'index.html'
    end
  end

  get '/upgrade' do
    send_file 'upgrade.html'
  end

  get '/download', name: :download do
    redirect_to ENV['GITHUB_RELEASES_URL']
  end

  get '/downloads/screencasts/:slug', name: :screencast do
    @screencast = @package.screencasts.find_by_slug params['slug']
    if @screencast
      redirect_to @screencast.file_url
    else
      redirect_to '/upgrade'
    end
  end

  get '/chapters/:slug.?:format?' do
    file = "chapters/#{params['slug']}.html"
    if File.exists?(File.join(__dir__, "build/html/#{file}"))
      if preview_chapters.include? params['slug']
        send_file(file)
      else
        if signed_in? and !current_user.package.nil?
          send_file file
        else
          redirect_to '/upgrade'
        end
      end
    else
      raise NotFound, 'That Page Does Not Exist'
    end
  end
end

run App
