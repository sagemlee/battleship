require "pry"
class Board

attr_reader :cell1,
            :cell2,
            :cell3,
            :cell4,
            :cell5,
            :cell6,
            :cell7,
            :cell8,
            :cell9,
            :cell10,
            :cell11,
            :cell12,
            :cell13,
            :cell14,
            :cell15,
            :cell16,
            :cell_hash

  def initialize
    @cell1 = Cell.new("A1")
    @cell2 = Cell.new("A2")
    @cell3 = Cell.new("A3")
    @cell4 = Cell.new("A4")

    @cell5 = Cell.new("B1")
    @cell6 = Cell.new("B2")
    @cell7 = Cell.new("B3")
    @cell8 = Cell.new("B4")

    @cell9 = Cell.new("C1")
    @cell10 = Cell.new("C2")
    @cell11 = Cell.new("C3")
    @cell12 = Cell.new("C4")

    @cell13 = Cell.new("D1")
    @cell14 = Cell.new("D2")
    @cell15 = Cell.new("D3")
    @cell16 = Cell.new("D4")
  end

  def cells
    @cell_hash =
      {
      "A1" => @cell1,
      "A2" => @cell2,
      "A3" => @cell3,
      "A4" => @cell4,
      "B1" => @cell5,
      "B2" => @cell6,
      "B3" => @cell7,
      "B4" => @cell8,
      "C1" => @cell9,
      "C2" => @cell10,
      "C3" => @cell11,
      "C4" => @cell12,
      "D1" => @cell13,
      "D2" => @cell14,
      "D3" => @cell15,
      "D4" => @cell16
      }
    @cell_hash
  end

  def valid_coordinate?(coordinate)
    cells
    @cell_hash.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)

# create helper method here if refactoring
    letters_array = []
    coordinates.each do |coordinate|
    letters_array << coordinate.slice(0)
    end

# create helper method here if refactoring
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
end
