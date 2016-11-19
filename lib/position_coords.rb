class PositionCoords
  attr_reader :container

  def initialize
    @container = []
  end

  def current_x
    # top of the stack x
    container.first[0]
  end

  def current_y
    # top of the stack y
    container.first[1]
  end

  def add(x, y)
    # add at the top of the stack
    container.unshift([x, y])
  end

  def remove
    # remove from the top of the stack
    container.shift
  end

end
