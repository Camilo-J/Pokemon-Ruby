#require neccesary files
require_relative "player"
require_relative "get_input"
# require_relative "battle"
 include GetInput

class Game
  attr_reader :name, :pokemon ,:pokemon_name
  def initialize
    @name = ""
    @pokemon = ""
    @pokemon_name = ""
    
  end
  def start
    #Create a welcome method(s) to get the name, pokemon and pokemon_name from the user
    puts"#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts"#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts"#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#"
    puts"#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts"#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts"Hello there! Welcome to the world of POKEMON! My name is OAK!"
    puts"People call me the POKEMON PROF!"
    
print"This world is inhabited by creatures called POKEMON! For some
people, POKEMON are pets. Others use them For fights. Myself...
I study POKEMON as a profession.\n"
@name = get_input("First, what is your name?")
puts "Right! So your name is #{name}!"
puts "Your very own POKEMON legend is about to unfold! A world of
dreams and adventures with POKEMON awaits! Lets go!
Here, #{name}! There are 3 POKEMON here! Haha!
When I was young, I was a serious POKEMON trainer.
In my old age, I have only 3 left, but you can have one! Choose! \n\n"
#puts "1. Charmander        2. Bulbasaur      3. Squirtle"
starters = Pokedex::POKEMONS.select { |_name, data| data[:starter] == true }
valid_starter = starters.keys
#valid_starter.each.with_index Do |pokemon, index|
#  print "#{index + 1}. #{pokemon}  "
#end
@pokemon = ""
until valid_starter.include?(pokemon)
  puts "Choose a starting pokemon"
  valid_starter.each.with_index do |pokemon, index|
    print "#{index + 1}. #{pokemon}  "
  end
  @pokemon = gets.chomp
end  
    puts "You selected #{pokemon} Great choice!
    Give your pokemon a name?"
@pokemon_name = ""
@pokemon_name = gets.chomp
if @pokemon_name.empty?
@pokemon_name = pokemon 
end 
puts "#{name}, raise your young #{pokemon_name} by making it fight!
When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
  end 
end

game = Game.new
game.start

name_gotten = game.name
pokemon_gotten = game.pokemon
pokemon_name_gotten = game.pokemon_name
 playyer1 = Player.new(name_gotten,pokemon_gotten,pokemon_name_gotten)

p playyer1.pokemon.stat
def print_menu
  puts "\n" + "-" * 30 + "Menu" + "-" * 30
  puts "1. Stats           2. Train          3. Leader"+"          4. Exit"
  puts "\n"

  print "> "
  gets.chomp.strip.downcase
end
action = nil
while action != "exit"
  action = print_menu
end  
    # Then create a Player with that information and store it in @player

=begin
    # Suggested game flow
    action = menu
    until action == "Exit"
      case action
      when "Train"
        train
        action = menu
      when "Leader"
        challenge_leader
        action = menu
      when "Stats"
        show_stats
        action = menu
      end
    end

    goodbye
  end

  def train
    # Complete this
  end

  def challenge_leader
    # Complete this
  end

  def show_stats
    # Complete this
  end

  def goodbye
    # Complete this
  end

  def menu
    # Complete this
  end
end

game = Game.new
game.start

#bot = Bot.new
=end