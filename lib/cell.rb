require 'pry'
require './lib/ship'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(type_of_ship)
    @ship = type_of_ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship.hit 
  end
end
