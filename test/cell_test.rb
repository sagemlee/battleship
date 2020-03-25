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

  def test_that_cell_starts_empty
    assert @cell.empty?
  end

  def test_it_can_be_not_empty
    @cell.place_ship(@cruiser)
    refute @cell.empty?
  end

  def test_that_place_ship_puts_ship_on_cell
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end

  def test_cell_has_not_been_fired_when_new
    assert_equal false, @cell.fired_upon?
  end
#
#   def test_it_has_been_fired_on
#       @cell.fire_upon
#     assert_equal true, @cell.fired_upon?
#   end
#
#   def test_fired_will_affect_health
#     @cell.place_ship(@cruiser)
#     @cell.fire_upon
#     assert_equal 2, @cell.ship.health
#   end
#
#
end

# @cell = Cell.new("B4")
# @cruiser = Ship.new("Cruiser", 3)
# @cell.place_ship(@cruiser)
# binding.pry
