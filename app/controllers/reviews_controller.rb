class ReviewsController < ApplicationController
  
  get '/reviews/new' do
    erb :'reviews/new'
  end
  
end