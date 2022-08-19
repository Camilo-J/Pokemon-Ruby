# require neccesary files
require_relative "pokemon"
require_relative "pokedex/pokemons"
class Player
  # (Complete parameters)
  def initialize(name, pokemon_species, name_pokemon = nil, level_pokemon = nil)
    # Complete this
    @name = name
    @level_pokemon = level_pokemon || 1
    @pokemon = Pokemon.new(pokemon_species.downcase, name_pokemon, @level_pokemon)
  end

  def select_move
    # Complete this
  end
end

# Create a class Bot that inherits from Player and override the select_move method
class Bot < Player
  def initialize
    pokemon_options = Pokedex::POKEMONS.keys
    selected_pokemon = pokemon_options.sample # ["Bulbasaur", "Charmander", "Squirtle", "Ratata", "Spearow", "Pikachu", "Onix"]
    super("Random Person", selected_pokemon, selected_pokemon.capitalize, level_pokemon)
  end
end

hola = Player.new("Camilo", "Fuego", "Gotin", 1)
p hola