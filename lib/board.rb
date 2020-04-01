require './lib/cell'
require 'pry'

class Board
  attr_reader :cells,
              :taken_coordinates

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }

    @taken_coordinates = []
  end

  def valid_coordinate?(coordinate)
    cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
# create helper method here if refactoring (.horizontal)
    letters_array = []
    coordinates.each do |coordinate|
      letters_array << coordinate.slice(0)
    end
# create helper method here if refactoring (.vertical)
    numbers_array = []
    coordinates.each do |coordinate|
      numbers_array << coordinate.slice(1)
    end

    if ((letters_array.uniq.size <= 1) && (ship.length == coordinates.count)) && (coordinates & @taken_coordinates.to_a == [])
      numbers_array.each_cons(2).all? {|a,b| b.to_i == a.to_i + 1}
    elsif ((numbers_array.uniq.size <= 1) && (ship.length == coordinates.count)) && (coordinates & @taken_coordinates.to_a == [])
      letters_array.each_cons(2).all? {|a,b| b.ord == a.ord + 1}
    else
      false
    end
  end

  def place(ship, set_of_coordinates)
    set_of_coordinates.each do |coordinate|
      @taken_coordinates << coordinate
    end
    set_of_coordinates.each do |coordinate|
      cells[coordinate].place_ship(ship)
    end
  end

  def render(secretboard = false)

    "  1 2 3 4 \n" +
    "A #{cells["A1"].render(secretboard)} #{cells["A2"].render(secretboard)} #{cells["A3"].render(secretboard)} #{cells["A4"].render(secretboard)}\n" +
    "B #{cells["B1"].render(secretboard)} #{cells["B2"].render(secretboard)} #{cells["B3"].render(secretboard)} #{cells["B4"].render(secretboard)}\n" +
    "C #{cells["C1"].render(secretboard)} #{cells["C2"].render(secretboard)} #{cells["C3"].render(secretboard)} #{cells["C4"].render(secretboard)}\n" +
    "D #{cells["D1"].render(secretboard)} #{cells["D2"].render(secretboard)} #{cells["D3"].render(secretboard)} #{cells["D4"].render(secretboard)}\n"
  end
end
