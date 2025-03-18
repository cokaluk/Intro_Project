# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'poke-api-v2'



Pokemon.delete_all()
Type.delete_all()
PokemonType.delete_all()

def get_pokemon_data(limit = 100)
  pokemon_data = []

  (1..limit).each do |id|
    data = PokeApi.get(pokemon: id)
    pokemon_data << {
      name: data.name,
      height: data.height,
      weight: data.weight,
      types: data.types.map {|type| type.type.name}

    }

  end
  pokemon_data
end


def seed
  pokemon_data = get_pokemon_data

  pokemon_data.each do |data|
    pokemon = Pokemon.create(name: data[:name], height: data[:height], weight: data[:weight])

    data[:types].each do |type_name|
      type = Type.find_or_create_by(name: type_name)
      pokemon.types << type
    end

  end
end

seed
