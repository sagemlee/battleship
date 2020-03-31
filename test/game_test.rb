require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/board'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exist
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_show_welcome_message
    game = Game.new

    assert_equal "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit.", game.welcome
  end

  def test_it_can_quit
    skip
    game = Game.new
    assert_equal "Thanks for trying!", game.start
  end

  def test_it_can_play_start_message
    game = Game.new
    assert_equal "Okay now we start", game.start
  end

#   def test_that_each_board_renders
#     game = Game.new
#     game.start
#
#     assert_equal
#   1 2 3 4
# A . . . .
# B . . . .
# C . . . .
# D . . . .
# end
