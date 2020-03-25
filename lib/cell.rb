class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship == nil
  end

  def place_ship(type_of_ship)
    @ship = type_of_ship
  end

  def fired_upon?
    if @cell == nil
      false
    else
      true
    end
  end


end
