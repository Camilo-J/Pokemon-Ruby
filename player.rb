# require neccesary files
require_relative "pokemon"
require_relative "get_input"
class Player
  include GetInput
  attr_reader :pokemon
  # (Complete parameters)

  def initialize(name, pokemon_species, name_pokemon, level_pokemon = nil)
    # Complete this
    @name = name
    @level_pokemon = level_pokemon || 1
    @pokemon = Pokemon.new(pokemon_species, name_pokemon, @level_pokemon)
  end

  def select_move
    # Complete this
    move = get_with_options("Select a move to attack: ", @pokemon.moves)
    p @pokemon.current_move = Pokedex::MOVES[move.downcase]
  end
end

# Create a class Bot that inherits from Player and override the select_move method
class Bot < Player
  def initialize
    pokemon_options = Pokedex::POKEMONS.keys
    selected_pokemon = pokemon_options.sample # ["Bulbasaur", "Charmander", "Squirtle", "Ratata", "Spearow", "Pikachu", "Onix"]
    super("Random Person", selected_pokemon, selected_pokemon.capitalize, rand(1..5))
  end
end

class Leader < Player
  def initialize
    super("Gym Leader Brock", "Onix", "Onix", 10)
  end
end
playyer1 = Player.new("hola","Pikachu","Pikachu")
playyer2 = Player.new("nose","Onix","Onix")
playyer1.select_move
# playyer2.select_move
# playyer1.pokemon.attack(playyer2)
 playyer1.pokemon.attack(playyer2.pokemon)