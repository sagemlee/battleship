require 'pry'
class Game
  attr_reader :player_input,
              :computer_board,
              :player_board,
              :computer_sub_coordinates,
              :computer_cruiser_coordinates,
              :player_cruiser_coordinates,
              :player_sub_coordinates

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
  end

# Main Menu

  def welcome
    "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit."
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
    end
  end

# Setup

  def computer_place_ships
    loop do
      @computer_sub_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      @computer_cruiser_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      if @computer_board.valid_placement?(@submarine, @computer_sub_coordinates) && @computer_board.valid_placement?(@cruiser, @computer_cruiser_coordinates)
        break
      end
    end
    @computer_board.place(@submarine, @computer_sub_coordinates)
    @computer_board.place(@cruiser, @computer_cruiser_coordinates)
  end

  def player_place_ships
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.
     1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Cruiser (3 spaces), for example 'A1 B1 C1':"

    @player_cruiser_coordinates = []

    loop do
      @player_cruiser_coordinates = gets.chomp.split(" ")
      if @player_board.valid_placement?(@cruiser, @player_cruiser_coordinates)
        break
      else
      puts "Those are invalid coordinates. Please try again:"
      puts ">"
      end
    end
    @player_board.place(@cruiser, @player_cruiser_coordinates)

    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    puts ">"

    @player_sub_coordinates = []

    loop do
      @player_sub_coordinates = gets.chomp.split(" ")
      if @player_board.valid_placement?(@submarine, @player_sub_coordinates)
        break
      else
      puts "Those are invalid coordinates. Please try again:"
      puts ">"
      end
    end
    @player_board.place(@submarine, @player_sub_coordinates)
  end


end
