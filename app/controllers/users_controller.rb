class UsersController < ApplicationController
  
  get '/users' do
    "So far, so good."
  end
  
  get '/signup' do
    erb :'users/signup'
  end
  
  post '/signup' do
    # info for name, email, or password is missing? redirect to /signup
    status = "post signup"
    if params[:name].empty? || params[:email].empty? || params[:password].empty? || User.find_by(email: params[:email])
      # status = "at least one of the params are empty, or found email so it's not unique"
      # binding.pry
      redirect to '/signup'
    else
      # status = "couldn't find email, so this is unique"
      @user = User.new(:name => params[:name], :password => params[:password], :email => params[:email])
      @user.save
      session[:user_id] = @user.id
      # binding.pry
      redirect to '/login'
    end
  end
  
  get '/login' do
    if session[:user_id]
      redirect to "/users/#{session[:user_id]}"
    else
      erb :'users/login'
    end
  end
  
  post '/login' do
    # binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      redirect to '/signup'
    end
  end
  
  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if @user
      erb :"users/show"
    else
      redirect to '/users'
    end
  end
  
  get '/logout' do
    session.clear
    redirect to '/login'
  end
  
end