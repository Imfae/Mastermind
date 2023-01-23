require './guessgame.rb'
require './algorithm.rb'
require './board.rb'
require './modules.rb'

# Class for codecreator game
class SetGame < GuessGame
  include Messages
  
  def initialize
    super
    @computer = SolverAlgorithm.new
    @number_of_guess = 1
  end

  def gameplay
    prompt_code
    @computer.initial_guess(@input)
    loop do
      feedback(@input, @code, @feedback)
      puts @board.display(@input, @feedback)
      break if code_guessed?
      @computer.input_elimination(@input, @feedback)
      @input = @computer.informed_guess
      @number_of_guess += 1
      @feedback = []
    end
    setgame_end_message(@number_of_guess)
  end

  private

  def prompt_code
    puts "\nPlease enter your code"
    begin
      @code = gets.chomp.upcase.split('')
      raise "\nPlease enter four of the following characters: Q, W, E, R, T, Y, U, I." unless code_accept?
      raise "\nYou've entered a #{@code.length}-character code! Please enter a four-character code instead." unless @code.length == 4
    rescue StandardError => e
      puts e
      retry
    end
  end

  def code_accept?
    @code.all? do |item|
      CODE_CHARACTERS.include?(item)
    end
  end
end
