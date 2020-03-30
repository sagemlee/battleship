require './lib/ship'
require './lib/board'
require './lib/game'
require 'pry'

game = Game.new

game.start

binding.pry
