require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def test_that_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_cells

    board = Board.new

    assert_instance_of Hash, board.cells
    assert_equal 16, board.cells.count
    assert_instance_of Cell, board.cells["A1"]
    assert_instance_of Cell, board.cells["D4"]
  end

  def test_that_coordinate_is_on_board

    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_has_valid_length

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2","A3"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_it_has_consecutive_coordinates

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_it_cannot_be_diagonal

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_that_placement_is_valid

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_that_ship_can_be_placed_on_board

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cruiser, cell_1.ship
  end

  def test_that_a_ship_is_on_multiple_cells

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_it_wont_place_overlapping_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_it_can_render
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal(
      "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n",
      board.render
    )
  end

  def test_it_can_render_hidden_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal(
      "  1 2 3 4 \n" +
      "A S S S . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n",
      board.render(true)
    )
  end
end
