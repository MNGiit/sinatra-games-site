class GamesController < ApplicationController
  
  get '/games' do
    @games = Game.all
    erb :'games/index'
  end
  
  get '/games/:id' do
    @game = Game.find_by_id(params[:id])
    if @game
      erb :"games/show"
    else
      redirect to '/games'
    end
  end

end