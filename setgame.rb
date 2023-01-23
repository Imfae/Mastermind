require './guessgame.rb'
require './algorithm.rb'
require './board.rb'
require './modules.rb'

# Class for codecreator game
class SetGame < GuessGame
  def initialize
    super
    @computer = Algorithm.new
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
      @feedback = []
    end
  end

  def prompt_code
    puts "\nPlease enter your code."
    begin
      @code = gets.chomp.upcase.split('')
      raise "\nPlease enter four of the following characters: Q, W, E, R, T, Y, U, I." unless input_accept?
      raise "\nYou've entered a #{@code.length}-character code! Please enter a four-character code instead." if @code.length != 4
    rescue StandardError => e
      puts e
      retry
    end
  end
end
