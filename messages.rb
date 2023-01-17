# Module contains messages shown in gameplay
module Messages
  def starting_message
    puts 'Welcome to the code-breaking game -- Mastermind!'
    puts "\n(Please peruse README.md if you're unfamiliar with the game.)"
    puts "\nWithout further ado... Let the Game Begin!"
    puts "\nGame setup: Do you want to allow duplicate colors in the generated code? (y/n)"
  end

  def closing_message(code_guessed)
    if code_guessed
      puts "\nCongratulations! You've broken the Super Secret Code!"
    else
      puts "\nOuch! You failed to break the code!"
    end
  end
end
