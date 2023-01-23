require './board.rb'
require './modules.rb'

# Class for codebreaker game
class GuessGame
  include Messages
  include CoreOperations
  
  def initialize
    @board = Board.new
    @code = []
    @input = []
    @feedback = []
    @allow_duplicate = false
  end

  def gameplay
    generate_code
    @allow_duplicate = allow_duplicate?
    12.times do
      @feedback = []
      prompt_input
      feedback(@input, @code, @feedback)
      puts @board.display(@input, @feedback)
      break if code_guessed?
    end
    guessgame_end_message(code_guessed?)
  end

  private

  def allow_duplicate?
    duplicate = gets.chomp.downcase
    if duplicate.include?('y')
      true
    elsif duplicate.include?('n')
      false
    else
      puts "\nPlease enter 'y' or 'n'."
      allow_duplicate?
    end
  end

  def prompt_input
    puts "\nChoose a four-character code from the following available characters\n-- Q W E R T Y U I --"
    begin
      @input = gets.chomp.upcase.split('')[0, 4]
      raise "\nPlease enter four of the following characters: Q, W, E, R, T, Y, U, I." unless input_accept?
      raise "\nCode length too short! Please enter a four-character code." unless @input.length >= 4
    rescue StandardError => e
      puts e
      retry
    end
  end

  def input_accept?
    @input.all? do |item|
      CODE_CHARACTERS.include?(item)
    end
  end

  def code_guessed?
    @code == @input
  end
end
