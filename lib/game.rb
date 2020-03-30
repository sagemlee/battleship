require 'pry'
class Game
  attr_reader :player_input

  def initialize
    @computer_board =
    #we have the below method in board class with render
    #make new boards, call render on those board 
    p "COMPUTER BOARD"
    p 11.times { print "=" }
    p "  1 2 3 4 \n" +
    "A . . . . \n" +
    "B . . . . \n" +
    "C . . . . \n" +
    "D . . . . \n"
    p @player_board =
    p "PLAYER BOARD"
    p 11.times { print "=" }
    p "  1 2 3 4 \n" +
     "A . . . . \n" +
     "B . . . . \n" +
     "C . . . . \n" +
     "D . . . . \n"
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
  replymessage = "Thanks for trying!"
  p replymessage
  elsif @player_input == "p"
  p   "Okay now we start"
  p @player_board
  p @computer_board

  # boards
  # place comp ships
  # place player ships
  # take turn
  end
end


end
