require './lib/cell'

class Board

attr_reader :cells

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

    if letters_array.uniq.size <= 1 && ship.length == coordinates.count
        numbers_array.each_cons(2).all? {|a,b| b.to_i == a.to_i + 1}

    elsif numbers_array.uniq.size <= 1 && ship.length == coordinates.count
        letters_array.each_cons(2).all? {|a,b| b.ord == a.ord + 1}
    else
        false
    end
  end

  def place(ship, set_of_coordinates)

    set_of_coordinates.each do |coordinate|
      cells[coordinate].place_ship(ship)
    end
  end

  def render

    "  1 2 3 4 \n" +
    "A #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render} \n" +
    "B #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render} \n" +
    "C #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render} \n" +
    "D #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render} \n"

  end
end
