class TypesController < ApplicationController
  def index
    @types = Type.all
    # page(params[:page]).per(5)
  end

  def show
    @type = Type.includes(:pokemons).find(params[:id])
  end
end
