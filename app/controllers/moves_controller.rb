class MovesController < ApplicationController
  def index
    @moves = Move.all
  end

  def show
    @move = Move.includes(:pokemons).find(params[:id])
  end
end
