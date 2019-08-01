class UsersController < ApplicationController
  
  get '/users' do
    "So far, so good."
  end
  
  get '/signup' do
    erb :'users/signup'
  end
  
  post '/signup' do
    # info for name, email, or password is missing? redirect to /signup
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      redirect to '/signup'
    else
      @user = User.new(:name => params[:name], :password => params[:password], :email => params[:email])
      @user.save
      session[:user_id] = @user.id
      # binding.pry
      redirect to '/login'
    end
  end
  
  get '/login' do
    erb :'users/login'
  end
  
  post '/login' do
    # binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      "Congrats it works"
    else
      redirect to '/signup'
    end
  end
  get '/logout' do
    "Placeholder for logout."
  end
  
  # /users/:id
end