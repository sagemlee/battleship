# one small change for man, one giant change for women

require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_has_ship_in_cell
    assert_nil @cell.ship
  end

  def test_it_can_place_ship
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end



end

# @cell = Cell.new("B4")
# @cruiser = Ship.new("Cruiser", 3)
# @cell.place_ship(@cruiser)
# @cell.place_ship(@cruiser)
# binding.pry
