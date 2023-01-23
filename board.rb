# Class for the display of Mastermind board
class Board
  def initialize
    @display = ''
  end

  def display(input, feedback)
    @display += "\n#{input.join(' ')}   #{feedback.sort.reverse.join('')}"
  end
end
