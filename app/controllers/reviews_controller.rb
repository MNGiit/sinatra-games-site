class ReviewsController < ApplicationController
  
  get '/reviews/new' do
    if session[:user_id]
      erb :'reviews/new'
    else
      redirect to '/login'
    end
  end
  
end