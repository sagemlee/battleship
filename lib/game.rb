require 'pry'
class Game
  attr_reader :player_input, :computer_board, :player_board

  def initialize

    @computer_board  = Board.new
    @player_board = Board.new
  end

def welcome
"Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
end

def computer_place_ships
  # loop do
     # sub = ["#{rand(65..68).chr + rand(5)}, #{rand(65..68).chr + rand(5)}"]
     # cruiser = ["#{rand(65..68).chr + rand(5)}, #{rand(65..68).chr + rand(5)}, #{rand(65..68).chr + rand(5)}"]
     # if sub.valid_placement? && cruiser.valid_placement?
     #   break
     #   sub
     #   cruiser
     # end
end

def player_place_ships
  puts "  I have laid out my ships on the grid.
  You now need to lay out your two ships.
  The Cruiser is three units long and the Submarine is two units long.
    1 2 3 4
  A . . . .
  B . . . .
  C . . . .
  D . . . .
  Enter the squares for the Cruiser (3 spaces), for example ['A1', 'B1', 'C1']:"
  puts gets.chomp
end

def start
  puts welcome
  @player_input = nil

  loop do
    @player_input = gets.chomp
      if @player_input == "q" || @player_input ==  "p"
        break
      else
        puts "Invalid input, try again"
      end
    end

  if @player_input == "q"
      replymessage = "Thanks for trying!"
      puts replymessage
    elsif @player_input == "p"
      computer_place_ships
      player_place_ships
      # puts "Here are the empty boards to start:"
      # puts "Computer Board"
      # puts @computer_board.render
      # puts "Player Board"
      # puts @player_board.render
  end
    # def   computer_place_ships
    # end


end
end



  # boards
  # place comp ships
  # place player ships
  # take turn
