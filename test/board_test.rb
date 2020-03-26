require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def test_that_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_cells

    board = Board.new
    assert_equal ({
    :"A1" => board.cell1,
    :"A2" => board.cell2,
    :"A3" => board.cell3,
    :"A4" => board.cell4,
    :"B1" => board.cell5,
    :"B2" => board.cell6,
    :"B3" => board.cell7,
    :"B4" => board.cell8,
    :"C1" => board.cell9,
    :"C2" => board.cell10,
    :"C3" => board.cell11,
    :"C4" => board.cell12,
    :"D1" => board.cell13,
    :"D2" => board.cell14,
    :"D3" => board.cell15,
    :"D4" => board.cell16
    }), board.cells
  end

end
# ({"A1": board.cell1, "A2": board.cell2, "A3": board.cell3})
