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
 
    # https://stackoverflow.com/questions/3936621/rails-find-by-with-2-fields
    # find_by(user_id: params[:user_id], project_id: params[:project_id])
    review = Review.find_by(:user_id => session[:user_id], :game_id => params[:game_id])
    binding.pry
    @review = Review.new(:score => params[:score], :content => params[:content], :user => User.find_by_id(session[:user_id]), :game => Game.find(params[:game_id]))
    "#{@review.score} - #{@review.content} - #{@review.user.name} - #{@review.game.title}"
  end
  
end