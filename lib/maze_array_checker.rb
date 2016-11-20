# This class checks the integrity of maze when it's converted to a 2 dimensional array
# Checks if it's 2 dimensional and not < 2 or > 2
# Check if Starting point is at the same position as the Ending point
require_relative 'helper_methods'

class MazeArrayChecker

  def initialize(maze_array)
    @maze_array = maze_array
  end

  def check
    check_if_two_dimensional
    check_coinsiding_points
    return true
  end

  private
  attr_reader :maze_array

  def check_if_two_dimensional
    error = "The array is not 2 dimensional, please enter a 2 dimensional array"
    raise error unless get_dimensions(maze_array) == 2
  end

  def check_coinsiding_points
    starting_point = HelperMethods.find_coords(maze_array, 'S')
    ending_point = HelperMethods.find_coords(maze_array, 'G')
    error = 'Starting point should not coinside with the ending point'
    raise error if starting_point == ending_point
  end

  def get_dimensions(maze_array)
    # return 0 if the array not an array
    return 0 unless maze_array.is_a? Array
    # return +1 every time we hit an array and then recursively loop until
    # there is no other array left, return the number of arrays
    return 1 + get_dimensions(maze_array[0])
  end

end
