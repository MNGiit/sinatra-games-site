class UsersController < ApplicationController
  
  get '/users' do
    "So far, so good."
  end
  
  get '/signup' do
    erb :'users/signup'
  end
  
  post '/signup' do
    # info for name, email, or password is missing? redirect to /signup
    if params[:name].nil? || params[:email].nil? || params[:password].nil?
      redirect to '/signup'
    else
      "Looks like params is legit."
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