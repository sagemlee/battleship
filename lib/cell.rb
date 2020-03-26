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

  # def ship
  #   @ship
  # end

  def place_ship(type_of_ship)
    @ship = type_of_ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if empty? == false
      @ship.hit
    end
  end

  def render(secret = false)
    if
      (secret == true)
      (empty? == false)
      (fired_upon? == false)
        "S"
    elsif
      (fired_upon? == false)
        "."
    elsif
      (empty? == false)
      (fired_upon? == true)
        "H"
    else
        "M"
    end
  end
end
