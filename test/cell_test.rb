# one small change for man, one giant change for women

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = cell.new("B4")
