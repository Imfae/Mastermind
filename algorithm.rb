require './modules.rb'
# Class for computer's algorithm when solving Mastermind
class SolverAlgorithm
  include CoreOperations
  
  def initialize
    @master_list = []
    master_list
    @guess_list = @master_list.dup
  end

  def initial_guess(input)
    until input.length == 4
      char = CODE_CHARACTERS[rand(CODE_CHARACTERS.length)]
      if input.include?(char)
        redo
      else
        2.times { input.push(char) }
      end
    end
  end

  def master_list
    8.times do |i|
      8.times do |j|
        8.times do |k|
          8.times do |l|
            @master_list.push([CODE_CHARACTERS[i], CODE_CHARACTERS[j], CODE_CHARACTERS[k], CODE_CHARACTERS[l]])
          end
        end
      end
    end
  end

  def input_elimination(input, previous_result)
    @guess_list.delete_if do |item|
      if previous_result.empty?
        input.any? { |i| item.include?(i) }
      else
        output = []
        feedback(item, input, output)
        previous_result.any? { |i| output.count(i) != previous_result.count(i) }
      end
    end
  end

  def informed_guess
    @guess_list[rand(@guess_list.length)]
  end
end
