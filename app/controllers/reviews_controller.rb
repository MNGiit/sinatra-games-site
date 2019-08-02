class ReviewsController < ApplicationController
  
  get '/reviews/new' do
    if session[:user_id]
      @games = Game.all
      erb :'reviews/new'
    else
      redirect to '/login'
    end
  end
  
  post '/reviews/new' do
    "It did a post review new"
    @review = Review.new(:score => params[:score], :content => params[:content], :user => User.find_by_id(session[:user_id]), :game => Game.find(params[:game_id]))
    "#{@review.score} - #{@review.content} - #{@review.user.name} - #{@review.game.title}"
  end
  
end