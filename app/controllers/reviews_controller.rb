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
    # https://stackoverflow.com/questions/3936621/rails-find-by-with-2-fields
    # find_by(user_id: params[:user_id], project_id: params[:project_id])
    review = Review.find_by(:user_id => session[:user_id], :game_id => params[:game_id])
    if review
      redirect to "/reviews/#{review.id}"
    else
      @review = Review.create(:score => params[:score], :content => params[:content], :user => User.find_by_id(session[:user_id]), :game => Game.find(params[:game_id]))
      redirect to "/reviews/#{@review.id}"
    end
  end
  
  get '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    if @review
      erb :"reviews/show"
    else
      redirect to '/games'
    end
  end
  
  get '/reviews/:id/edit' do
    set_review
    if @review.user.id == session[:user_id]
      erb :'reviews/edit'
    elsif !session[:user_id]
      redirect to '/login'
    else
      redirect to '/games'
    end
  end
  
  patch '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    if @review && @review.user.id == session[:user_id]
      if @review.update(content: params[:content], score: params[:score])
        redirect to "/reviews/#{@review.id}"
      else
        redirect to "/reviews/#{@review.id}/edit"
      end
    else
      redirect to "/reviews/#{@review.id}"
    end
  end
  
  delete '/reviews/:id/delete' do
    @review = Review.find_by_id(params[:id])
    if session[:user_id]
      if @review && @review.user_id == session[:user_id]
        @review.delete
        user = User.find_by_id(session[:user_id])
        redirect to "/users/#{user.id}"
      else
        redirect to '/games'
      end
    else
      redirect to '/login'
    end
  end
  
  private

  def set_review
    @review = Review.find_by_id(params[:id])
    if !@review
        redirect to '/games'
    end
  end

end