require './guessgame.rb'

def play_again?
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

loop do
  game = GuessGame.new
  game.gameplay
  puts "\nWould you like to play again? (y/n)"
  play_again? ? redo : break
end