class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(type_of_ship)
    @ship = type_of_ship
  end


end
