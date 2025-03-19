class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:types).page(params[:page]).per(20)
  end
end
