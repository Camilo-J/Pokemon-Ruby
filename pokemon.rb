# require neccesary files
require_relative "pokedex/pokemons"
class Pokemon
  attr_reader :char_pokemon , :indivudal_stats, :effort_values
  # include neccesary modules

  # (complete parameters)
  def initialize(specie, name, level)
    #@char_pokemon = Pokedex::POKEMONS.select { |name, data| name == specie}.values
    @char_pokemon = Pokedex::POKEMONS[specie.capitalize]
    # Retrieve pokemon info from Pokedex and set instance variables
    @name = name || specie
    @species = specie
    @level = level || 1
    @type = @char_pokemon[:type]
    @base_exp = @char_pokemon[:base_exp]
    @effort_points = @char_pokemon[:effort_points]
    @growth_rate = @char_pokemon[:growth_rate]
    @base_stats = @char_pokemon[:base_stats]
    @moves = @char_pokemon[:moves]
    @max_hp = @base_stats[:hp]
    @hp = @max_hp
    @attack = @base_stats[:attack]
    @defense = @base_stats[:defense]
    @special_attack = @base_stats[:special_attack]
    @special_defense = @base_stats[:special_defense]
    @speed = @base_stats[:speed]
    # Calculate Individual Values and store them in instance variable
    @indivudal_stats = { hp: rand(0..31), attack: rand(0..31), defense: rand(0..31), special_attack: rand(0..31), special_defense: rand(0..31), speed: rand(0..31) }
    # Create instance variable with effort values. All set to 0
    @effort_values = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    @experience_got = 0
    # Store the level in instance variable
    # If level is 1, set experience points to 0 in instance variable.
   
    # If level is not 1, calculate the minimum experience point for that level and store it in instance variable.
    # Calculate pokemon stats and store them in instance variable
  end

  def prepare_for_battle
    # Complete this
  end

  def receive_damage
    # Complete this
  end

  def set_current_move
    # Complete this
  end

  def fainted?
    # Complete this
  end

  def attack(target)
    # Print attack message 'Tortuguita used MOVE!'
    # Accuracy check
    # If the movement is not missed
    # -- Calculate base damage
    # -- Critical Hit check
    # -- If critical, multiply base damage and print message 'It was CRITICAL hit!'
    # -- Effectiveness check
    # -- Mutltiply damage by effectiveness multiplier and round down. Print message if neccesary
    # ---- "It's not very effective..." when effectivenes is less than or equal to 0.5
    # ---- "It's super effective!" when effectivenes is greater than or equal to 1.5
    # ---- "It doesn't affect [target name]!" when effectivenes is 0
    # -- Inflict damage to target and print message "And it hit [target name] with [damage] damage""
    # Else, print "But it MISSED!"
  end

  def increase_stats(target)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"

    # If the new experience point are enough to level up, do it and print
    # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat
  end

  # private methods:
  # Create here auxiliary methods
end


# pokemon1 = Pokemon.new("Charmander", nil, 1)
# #p pokemon1
#  p pokemon1.effort_values


