require 'pry'

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
    if fired_upon? == false && empty? == false && secret == true
        "S"
    elsif fired_upon? == false
        "."
    elsif fired_upon? == true && empty? == true
        "M"
    elsif @ship.sunk? == true
        "X"
    elsif fired_upon? == true && empty? == false
        "H"
    end
  end
end
