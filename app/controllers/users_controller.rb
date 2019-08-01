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
      binding.pry
      redirect to '/login'
    end
  end
  
  get '/login' do
    "Place holder for login. Don't forget to do a Post"
  end
  
  get '/logout' do
    "Placeholder for logout."
  end
  
  # /users/:id
end