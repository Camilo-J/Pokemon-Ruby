#require neccesary files
require_relative "player"
# require_relative "battle"
 include GetInput
 include MethodsGame
class Game
  attr_accessor :name, :pokemon_name, :pokemon, :playyer1
  def initialize
    @name = ""
    @pokemon = ""
    @pokemon_name = ""
    @playyer1 = ""
  end
  def start
    #Create a welcome method(s) to get the name, pokemon and pokemon_name from the user
    puts welcome
    name = get_input("First, what is your name?")
    puts welcome_with_data(name)
    # puts "1. Charmander        2. Bulbasaur      3. Squirtle"
    starters = Pokedex::POKEMONS.select { |_name, data| data[:starter] == true }
    valid_starter = starters.keys
    #valid_starter.each.with_index Do |pokemon, index|
    # print "#{index + 1}. #{pokemon}  "
    #end
    pokemon = get_with_options2("Choose a starting pokemon",valid_starter)
    puts "You selected #{pokemon} Great choice!
    Give your pokemon a name?"
    pokemon_name = gets.chomp
    pokemon_name = pokemon  if @pokemon_name.empty?
    puts "#{name}, raise your young #{pokemon_name} by making it fight!
    When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    
    playyer1 = Player.new(name,pokemon,pokemon_name)
    # create_player
    game_flow(playyer1)
    goodbye
  end

  def train(playyer1,bot)
    # Complete this
    #bot = Bot.new
    battle_bot = Battle.new(playyer1, bot )
    battle_bot.start
  end

  def challenge_leader(playyer1,leader)
    # Complete this
    #leader = Leader.new
    battle_leader = Battle.new(playyer1, leader )
    battle_leader.start
  end

  def show_stats(jugador,pokemon_name_gotten)
    # Complete this
   puts ["#{pokemon_name_gotten}:",
    "Kind: #{jugador.pokemon.species}",
    "Level: #{jugador.pokemon.level}",
    "Type: #{jugador.pokemon.type}",
    "Stats:"]
    jugador.pokemon.stat.each do |stat, value|
      puts "#{stat}: #{value}"
    end
  end

  def goodbye
    # Complete this
    ["Thanks for playing Pokemon Ruby",
    "This game was created with love by: Elias Mesones, Carlos Mendoza, Camilo Huanca, Jairo Pinedo"]
  end

  def game_flow(playyer1)
    options = ["fight", "leave"]
    option_menu = ["Train", "Leader", "Stats"]
    action = ""
    until action == "Exit"
      action = print_menu
      case action
      when "Train"
      bot = Bot.new
      valor = desicion(options, playyer1, bot)
      if valor.downcase == "fight"
        train(playyer1,bot)
        action = print_menu
      else
        action = print_menu
      end
      when "Leader"
      leader = Leader.new
      valor1 = desicion(options,playyer1,leader,"fight!")
      if valor1.downcase == "fight"
        challenge_leader(playyer1,leader)
        action = print_menu
      else
        action = print_menu
      end
      when "Stats"
      show_stats(playyer1,pokemon_name_gotten)
      action = print_menu
      end
      puts "Invalid Option" unless option_menu.include?(action)
    end
  end
end

game = Game.new
game.start
