require 'pry'
class Game
  attr_reader :player_input

  def initialize
    # @computer_board =
    # @player_board =
    # @game_over = false
  end

def welcome
"Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
end

def start
  p welcome
  @player_input = nil

  loop do
    @player_input = gets.chomp
      if @player_input == "q" || @player_input ==  "p"
        break
      else
        p "Invalid input, try again"
      end
    end


  if @player_input == "q"
    p "Thanks for trying!"
  elsif @player_input == "p"
  p   "Okay now we start"
  play
  turn
  boards
  place comp ships
  place player ships
  take turn

  end
end


end
