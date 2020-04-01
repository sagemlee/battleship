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

    assert_equal "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit.", game.welcome
  end

  def test_it_can_quit
    skip
    game = Game.new
    assert_equal "Thanks for trying!", game.start
  end

  def test_computer_places_ships_on_board
    game = Game.new
    game.computer_place_ships

    assert_equal false, game.computer_sub_coordinates[0].empty?
    assert_equal false, game.computer_cruiser_coordinates[0].empty?
  end

  def test_it_can_place_player_ships
    game = Game.new
    game.player_place_ships

    assert_equal false, game.player_cruiser_coordinates[0].empty?
    assert_equal false, game.player_sub_coordinates[0].empty?
  end
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
