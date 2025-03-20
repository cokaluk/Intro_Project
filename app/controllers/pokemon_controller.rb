class PokemonController < ApplicationController
  def index
    if params[:search].present?
      @pokemons = Pokemon.where("name Like ?", "%#{params[:search]}%").page(params[:page]).per(20)
    else
      @pokemons = Pokemon.includes(:types).page(params[:page]).per(20)
    end

  end

  def show
    @pokemon = Pokemon.includes(:types, :moves).find(params[:id])
  end

end
