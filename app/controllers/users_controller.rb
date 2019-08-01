class UsersController < ApplicationController
  
  get '/users' do
    "So far, so good."
  end
  
  get '/signup' do
    erb :'users/signup'
  end
  
  get '/login' do
    "Place holder for login. Don't forget to do a Post"
  end
  
  get '/logout' do
    "Placeholder for logout."
  end
  
  # /users/:id
end