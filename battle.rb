require_relative "pokemon"
class Battle
  # (complete parameters)
  attr_reader :name
  def initialize(player,bot)
    # Complete this
    @player = player
    @bot = bot
    @player_poke = @player.pokemon
    @bot_poke = @bot.pokemon
  end

  def start
    # Prepare the Battle (print messages and prepare pokemons)
    @player_poke.prepare_for_battle
    @bot_poke.prepare_for_battle
  
   
   # Until one pokemon faints
    # --Print Battle Status
    # --Both players select their moves
    battle_loop
    # --Calculate which go first and which second
    winner = @player_poke.fainted? ? @bot_poke : @player_poke
    losser = winner == @player_poke ? @bot_poke : @player_poke
    
    
    # --First attack second
    # --If second is fainted, print fainted message
    # --If second not fainted, second attack first
    # --If first is fainted, print fainted message
    # Check which player won and print messages
    # If the winner is the Player increase pokemon stats
   puts "#{winner.name} WINS!"
   puts "#{losser.name} FAINTED!"
   puts "--------------------------------------------------"
   if winner == @player_poke
    winner.increase_stats(losser)
    puts "#{winner.name} gained #{winner.experience_got} experience points"
   end
   puts "-------------------Battle Ended!-------------------"
  end
   private
  def select_first(player_poke, bot_poke)
    player_move = @player_poke.current_move
    bot_move = @bot_poke.current_move

    if player_move[:priority] > bot_move[:priority]
      player_poke
    elsif player_move[:priority] < bot_move[:priority]
      bot_poke
    elsif player_poke.current_speed > bot_poke.current_speed
      player_poke
    elsif player_poke.current_speed < bot_poke.current_speed
      bot_poke
    else
      [player_poke, bot_poke].sample
    end
  end

  def battle_loop
    puts "#{@bot.name} sent out #{@bot_poke.name.upcase}!"
    puts "#{@player.name} sent out #{@player_poke.name.upcase}!"
    puts "-------------------Battle Start!-------------------"
    until @player_poke.fainted? ||  @bot_poke.fainted?

   puts "#{@player.name}'s #{@player_poke.name.upcase} - Level #{@player_poke.level}"
   puts  "HP: #{@player_poke.current_hp}"
   puts "#{@bot.name}'s #{@bot_poke.name.upcase} - Level #{@bot_poke.level}"
   puts  "HP: #{@bot_poke.current_hp}"
   puts "\n"
      @player.select_move
      @bot.select_move
  
      first = select_first(@player_poke, @bot_poke)
      second = first == @player_poke ? @bot_poke : @player_poke
  
      puts "-------------------------------------------------"
      first.attack(second)
      second.attack(first) unless second.fainted?
      puts "-------------------------------------------------"
    end
  end
end

