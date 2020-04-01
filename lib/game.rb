require 'pry'
require './lib/board'

class Game
  attr_reader :player_input,
              :computer_board,
              :player_board,
              :computer_sub_coordinates,
              :computer_cruiser_coordinates,
              :player_cruiser_coordinates,
              :player_sub_coordinates,
              :player_target,
              :computer_target

  def initialize
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
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
    end
    computer_place_ships
    player_place_ships

    loop do
      turn
      @computer_render = @computer_board.render.count "X"
      @player_render = @player_board.render.count "X"
      if @computer_render == 5
          puts "You won!"
        break
      elsif @player_render == 5
        puts "Computer won!"
        break
      end
    end
    start 
  end


# Setup

  def computer_place_ships
    loop do
      @computer_sub_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      if @computer_board.valid_placement?(@comp_submarine, @computer_sub_coordinates)
        @computer_board.place(@comp_submarine, @computer_sub_coordinates)
        break
      end
    end
    loop do
      @computer_cruiser_coordinates = [rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}", rand(65..68).chr + "#{rand(1..4)}"]
      if @computer_board.valid_placement?(@comp_cruiser, @computer_cruiser_coordinates)
        @computer_board.place(@comp_cruiser, @computer_cruiser_coordinates)
        break
      end
    end

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
      if @player_board.valid_placement?(@player_cruiser, @player_cruiser_coordinates)
        break
      else
      puts "Those are invalid coordinates. Please try again:"
      puts ">"
      end
    end
    @player_board.place(@player_cruiser, @player_cruiser_coordinates)

    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    puts ">"

    @player_sub_coordinates = []

    loop do
      @player_sub_coordinates = gets.chomp.split(" ")
      if @player_board.valid_placement?(@player_submarine, @player_sub_coordinates)
        break
        else
          puts "Those are invalid coordinates. Please try again:"
          puts ">"
      end
    end
    @player_board.place(@player_submarine, @player_sub_coordinates)
  end

  def turn
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
    puts "Enter the coordinate for your shot:"

    loop do
      @player_target = gets.chomp
        if @computer_board.cells[@player_target].fired_upon? == false
          break
        else
          puts "Please enter a valid coordinate:"
        end
    end
    @computer_board.cells[@player_target].fire_upon

    loop do
      @computer_target = rand(65..68).chr + (rand(1..4)).to_s
        if @player_board.cells[@computer_target].fired_upon? == false
          break
        end
      end
    @player_board.cells[@computer_target].fire_upon

  if @player_board.cells[@computer_target].render == "M"
      computer_message = "was a miss"
    elsif @player_board.cells[@computer_target].render == "H"
      computer_message = "was a hit"
    elsif @player_board.cells[@computer_target].render == "X"
      computer_message = "has sunk a ship"
  end

  if @computer_board.cells[@player_target].render == "M"
      player_message = "was a miss"
    elsif @computer_board.cells[@player_target].render == "H"
      player_message = "was a hit"
    elsif @computer_board.cells[@player_target].render == "X"
      player_message = "has sunk a ship"
  end
  puts " "
  puts "==============RESULTS=============="

  puts "Your shot on #{player_target} #{player_message}."
  puts "My shot on #{computer_target} #{computer_message}."

end
end
