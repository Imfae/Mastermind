# Module contains messages shown in gameplay
module Messages
  def starting_message
    puts 'Welcome to the code-breaking game -- Mastermind!'
    puts "\n(Please peruse README.md if you're unfamiliar with the game.)"
    puts "\nWithout further ado... Let the Game Begin!"
    puts "\nWould you like to be the code creator (1) or the code breaker (2)?"
  end

  def creator
    puts "\nThink of a four-character code consisting of the following characters\n-- Q W E R T Y U I --"
  end

  def breaker
    puts "\nGame setup: Do you want to allow duplicate colors in the generated code? (y/n)"
  end

  def guessgame_end_message(code_guessed)
    if code_guessed
      puts "\nCongratulations! You've broken the Super Secret Code!"
    else
      puts "\nOuch! You failed to break the code!"
    end
  end

  def closing_message
    puts "\nWould you like to play again? (y/n)"
  end

  def setgame_end_message(number)
    puts "\nThe computer cracked your code in #{number} tries!"
  end
end

# Module contains code generation method and feedback method
module CoreOperations
  def generate_code
    if @allow_duplicate
      4.times { @code.push(CODE_CHARACTERS[rand(CODE_CHARACTERS.length)]) }
    else
      until @code.length == 4
        char = CODE_CHARACTERS[rand(CODE_CHARACTERS.length)]
        @code.include?(char) ? redo : @code.push(char)
      end
    end
  end

  def feedback(input, code, result)
    input_modified = input.dup
    code_modified = code.dup
    4.times do |i|
      if input[i] == code[i]
        result.push('X')
        input_modified[i] = 0
        code_modified[i] = 2
      end
    end
    input_modified.each_index do |i|
      input_modified[i] = 0 if input_modified.count(input_modified[i]) > 1
    end
    code_modified.each_index do |i|
      input_modified.each_index do |j|
        if input_modified[i] == code_modified[j] && i != j
          result.push('O') 
          input_modified[i] = 1
        end
      end
    end
  end
end
