require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_it_starts_with_no_ship
    cell = Cell.new("B4")

    assert_nil cell.ship
  end

  def test_it_starts_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end

  def test_it_can_be_not_empty
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
  end

  def test_it_can_place_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal cruiser, cell.ship
  end

  def test_it_starts_not_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cell.fired_upon?
  end

  def test_it_can_be_fired_upon
    cell = Cell.new("B4")

    cell.fire_upon

    assert_equal true, cell.fired_upon?
  end

  def test_that_fire_upon_affects_ship_health
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal 2, cell.ship.health
  end

  def test_it_can_render_when_created
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
  end

  def test_that_it_can_render_when_hit_with_no_ship
    cell_1 = Cell.new("B4")

    cell_1.fire_upon

    assert_equal "M", cell_1.render
  end

  def test_it_can_render_with_ship
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
  end

  def test_it_can_show_hidden_ship
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal "S", cell_2.render(true)
  end

  def test_that_fire_upon_renders_with_ship
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    assert_equal "H", cell_2.render
  end

  def test_that_sunk_ship_renders
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    cruiser.hit
    cruiser.hit

    assert_equal "X", cell_2.render
  end
end
