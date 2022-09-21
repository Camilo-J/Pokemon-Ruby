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

