class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:types).page(params[:page]).per(20)
  end

  def show
    @pokemon = Pokemon.includes(:types, :moves).find(params[:id])
  end

end
