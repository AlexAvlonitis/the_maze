require 'pry'
require_relative 'position_coords'

class MazeSolver

  def initialize(maze_array)
    @maze_array = maze_array
  end

  def execute
    @starting_point = find_starting_point_coords
    if solve_maze(starting_point[0], starting_point[1])
      puts "solved"
      p position.container
    else
      puts "unsolvable"
    end
  end

  def position
    @position ||= PositionCoords.new
  end

  private
  attr_reader :maze_array, :starting_point

  # Will represent the array as a board with w (width) & h (height)
  def solve_maze(h, w)
    # return false if we are on right path
    return false if check_maze_boundaries(h, w)
    # Check if i reached the goal return true
    if goal_reached?(h, w)
      puts "Goal at [#{h}][#{w}]"
      return true
    end
    # Check if i hit a wall 'X' or the starting point 'S'
    return false if blocked_path?(h, w)
    # Leave a trail on the path so we won't revisit
    leave_trail(h, w)

    # # recursions until goal or dead end
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
    # [0] because it's a rectangular maze therefore all the rows are the same
    # width, so are just checking one of them
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
    position.add(h, w)
  end

end
