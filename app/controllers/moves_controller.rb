class MovesController < ApplicationController
  def index
    @moves = Move.page(params[:page]).per(20)
  end

  def show
    @move = Move.includes(:pokemons).find(params[:id])
  end
end
