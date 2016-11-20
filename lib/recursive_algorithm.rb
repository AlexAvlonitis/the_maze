# The recursive algorithm will be given a starting H for height and W for width values.
# If the H and W values are not on a wall, the method will call itself with all adjacent H and W values,
# making sure that it did not already use those H and W values before.
# If the H and W values are those of the end location,
# it will save all the previous instances of the method as the correct path.
require_relative 'correct_path_container'

class RecursiveAlgorithm

  def initialize(maze_array)
    @maze_array = maze_array
    @starting_point = find_starting_point_coords
  end

  def solve_maze(h = starting_point[0], w = starting_point[1])
    # return false if we are on the right path
    return false if check_maze_boundaries(h, w)
    # Check if we reached the goal and return true
    if goal_reached?(h, w)
      puts "Goal at [#{h}][#{w}]"
      return true
    end
    # Check if we hit a wall 'X' or the starting point 'S'
    return false if blocked_path?(h, w)
    # Leave a trail on the path so we won't revisit
    leave_trail(h, w)

    # recursions until goal or dead end
    if solve_maze(h - 1, w) # go up
      mark_valid_path(h, w)
      return true
    end
    if solve_maze(h + 1, w) # go down
      mark_valid_path(h, w)
      return true
    end
    if solve_maze(h, w - 1) # go right
      mark_valid_path(h, w)
      return true
    end
    if solve_maze(h, w + 1) # go left
      mark_valid_path(h, w)
      return true
    end
    return false
  end

  def correct_path_container
    @correct_path_container ||= CorrectPathContainer.new
  end

  private
  attr_reader :maze_array, :starting_point

  def find_starting_point_coords
    find_coords("S")
  end

  def find_coords(element)
    # finds the coordinates of an element inside a 2 dimentional array
    # and retuns a an array ["0", "1"] pointing to where it is
    a = maze_array.map.with_index do |subarray, i|
          j = subarray.index(element)
          "#{i} #{j}" if j
        end
    # Deletes nils, re-join as seperate elements and convert to integers
    # to make it look like this [0][1]
    a.compact.join.split(" ").map(&:to_i)
  end

  def check_maze_boundaries(h, w)
    # if it's not within the 2 dimentional boundaries of our maze array
    !!(w < 0 || h < 0 || h > maze_height || w > maze_width)
  end

  def maze_height
    maze_array.size - 1
  end

  def maze_width
    # [0] because it's a rectangular maze therefore all the rows are the same width
    maze_array[0].size - 1
  end

  def goal_reached?(h, w)
    !!(maze_array[h][w] == 'G')
  end

  def blocked_path?(h, w)
    # if not wall 'X' or visited path '#'
    !!(maze_array[h][w] == 'X' || maze_array[h][w] == '#')
  end

  def leave_trail(h, w)
    maze_array[h][w] = '#'
  end

  def mark_valid_path(h, w)
    maze_array[h][w] = '+'
    # add the valid positions in our stack and we can access anytime (save to db, cache...)
    correct_path_container.add(h, w)
  end
end
