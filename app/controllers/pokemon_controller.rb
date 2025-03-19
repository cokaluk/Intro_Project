class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:types).all
  end
end
