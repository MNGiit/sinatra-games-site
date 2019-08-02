class ReviewsController < ApplicationController
  
  get '/reviews/new' do
    if session[:user_id]
      @games = Game.all
      binding.pry
      erb :'reviews/new'
    else
      redirect to '/login'
    end
  end
  
  post '/reviews/new' do
    binding.pry
    "It did a post review new"
  end
  
end