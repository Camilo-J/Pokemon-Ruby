module GetInput
    def get_input(prompt)
      input = ""
      while input.empty?
        puts prompt
        print "> "
        input = gets.chomp
      end
  
      input
    end
  
    def get_with_options(prompt, options)
      input = ""
      until options.include?(input.downcase)
        puts prompt
        print_options(options)
        print "> "
        input = gets.chomp
      end
  
      input
    end
  
    def print_options(options)
      options.each.with_index do |option, index|
        puts "#{index + 1}. #{option.capitalize}"
      end

    end
    def desicion(options,player, bot, mensaje = nil)
      mensaje_got = mensaje || "training"
      puts "#{player.name} challenge #{bot.name} for #{mensaje_got}"
      puts "#{bot.name} has a #{bot.pokemon.name} level #{bot.pokemon.level}"
      puts "What do you want to do now?"
      input = ""
      until options.include?(input.downcase)
        print_options(options)
        print "> "
        input = gets.chomp
      end
      input
    end
  end
def welcome
   ["#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#",
    "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#",
    "#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#",
    "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#",
    "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#",
    "Hello there! Welcome to the world of POKEMON! My name is OAK!",
    "People call me the POKEMON PROF!",
    "This world is inhabited by creatures called POKEMON! For some people",
    "POKEMON are pets. Others use them For fights. Myself...",
    "I study POKEMON as a profession."]
end

def welcome_with_data(name)
  ["Right! So your name is #{name}!",
    "Your very own POKEMON legend is about to unfold! A world of",
    "dreams and adventures with POKEMON awaits! Lets go!",
    "Here, #{name}! There are 3 POKEMON here! Haha!",
    "When I was young, I was a serious POKEMON trainer.",
    "In my old age, I have only 3 left, but you can have one! Choose!\n\n"
  ]
end

def get_with_options2(prompt, options)
  input = ""
  until options.include?(input)
    puts prompt
    print_options2(options)
    print "> "
    input = gets.chomp
    puts "Invalid option" unless options.include?(input)
  end

  input
end

def print_options2(options)
  options.each.with_index do |option, index|
    print "#{index + 1}. #{option.capitalize}   "
  end
  puts ""
end