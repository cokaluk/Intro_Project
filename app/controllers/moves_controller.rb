class MovesController < ApplicationController
  def index
    @moves = Move.all
  end

  def show
    @move = Move.includes(:pokemons).find(params[:id])
    # i have a feeling this is slow/bad but for now idk how else to get pokemons that are associated with a specific pokemon
  end
end
