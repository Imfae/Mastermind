require './guessgame.rb'
require './setgame.rb'
require './modules.rb'

CODE_CHARACTERS = %w[Q W E R T Y U I].freeze

include Messages

# Class for Mastermind game
class Mastermind
  def self.play
    loop do
      starting_message
      prompt_input
      if @input == 1
        creator
        new_game = SetGame.new
        new_game.gameplay
      else
        breaker
        game = GuessGame.new
        game.gameplay
      end
      closing_message
      play_again? ? redo : break
    end
  end

  private_class_method def self.prompt_input
    @input = gets.chomp.to_i
    raise "\nPlease enter '1' or '2'" unless @input == 1 || @input == 2
  rescue StandardError => e
    puts e
    retry
  end

  private_class_method def self.play_again?
    play_again = gets.chomp.downcase
    if play_again.include?('y')
      true
    elsif play_again.include?('n')
      false
    else
      puts "\nPlease enter 'y' or 'n'."
      play_again?
    end
  end
end

Mastermind.play
