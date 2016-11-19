class CorrectPath
  attr_reader :show

  def initialize
    @show = []
  end

  def add(x, y)
    # add at the top of the stack
    show.unshift([x, y])
  end

  def remove
    # remove from the top of the stack
    show.shift
  end
end
