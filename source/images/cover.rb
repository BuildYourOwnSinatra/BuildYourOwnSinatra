#########################
# Build Your Own Sinatra
# By: K-2052
#########################

alias_method :display, :run

class Cover < YourFramework
  get '/title' do
    Response.new 'Build Your Own Sinatra'
  end

  get '/author' do
    Response.new 'K-2052'
  end

  get '/license' do
    Response.new 'Licensed Under MIT'
  end

  get '/greeting' do
    msg = "Hey #{params['name']}, ready to build a framework?!"
    AwesomeReponse.new msg, 200
  end
end

display Cover
