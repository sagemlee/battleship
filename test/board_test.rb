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
end
