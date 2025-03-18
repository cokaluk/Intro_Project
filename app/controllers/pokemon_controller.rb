class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:types, :moves).all
  end
end
