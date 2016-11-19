class PositionCoords
  attr_reader :container

  def initialize
    @container = []
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
