require './board.rb'
require './messages.rb'

# Class for codebreaker game
class GuessGame
  include Messages

  CODE_CHARACTERS = %w[Q W E R T Y U I].freeze
  
  def initialize
    @board = Board.new
    @code = []
    @input = []
    @feedback = []
    @allow_duplicate = false
  end

  def gameplay
    starting_message
    generate_code
    @allow_duplicate = allow_duplicate?
    12.times do
      @feedback = []
      prompt_input
      feedback
      puts @board.display(@input, @feedback)
      break if code_guessed?
    end
    closing_message(code_guessed?)
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

  def generate_code
    if @allow_duplicate
      4.times { @code.push(CODE_CHARACTERS[rand(CODE_CHARACTERS.length)]) }
    else
      until @code.length == 4
        char = CODE_CHARACTERS[rand(CODE_CHARACTERS.length)]
        if @code.include?(char)
          redo
        else
          @code.push(char)
        end
      end
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

  def feedback
    input_modify = @input.dup
    code_modify = @code.dup
    4.times do |i|
      if @input[i] == @code[i]
        @feedback.push('X')
        input_modify[i] = 0
        code_modify[i] = 2
      end
    end
    input_modify.each_index do |i|
      input_modify[i] = 3 if input_modify.count(input_modify[i]) > 1
    end
    code_modify.each_index do |i|
      input_modify.each_index do |j|
        if input_modify[i] == code_modify[j] && i != j
          @feedback.push('O') 
          input_modify[i] = 1
        end
      end
    end
  end

  def code_guessed?
    @code == @input
  end
end
