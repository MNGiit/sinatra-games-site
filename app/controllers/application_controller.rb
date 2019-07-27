require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    # set :session_secret, "wholikesvideogames"
  end

  get '/' do 
    # erb :index
    "Hello world! This part at least works." 
  end

end