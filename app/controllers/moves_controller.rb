class MovesController < ApplicationController
  def index
    @moves = Move.page(params[:page]).per(60)
  end

  def show
    @move = Move.includes(:pokemons).find(params[:id])
  end
end
