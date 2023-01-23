# Class for computer's algorithm when solving Mastermind
class Algorithm
  def initialize
    @master_list = []
    master_list
    @guess_list = @master_list.dup
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

  def input_elimination(input, previous_result)
    output = []
    @guess_list.delete_if do |item|
      if previous_result.empty?
        input.any? do |i|
          item.include?(i)
        end
      else
        input.any? do |i|
          item.none?(i)
        end
        feedback(item, input, output)
        previous_result.any? do |i|
          output.count(i) != previous_result.count(i)
        end
      end
    end
  end

  def informed_guess
    @guess_list[rand(@guess_list.length)]
  end
end
