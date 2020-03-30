require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/board'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exist
    skip
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_show_welcome_message
    game = Game.new

    assert_equal "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit.", game.welcome
  end

  def test_it_has_set_up
    skip
  end

end
