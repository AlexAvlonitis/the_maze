module HelperMethods
  # Extracted into a module so it can be reused in multiple classes

  def self.find_coords(maze_array, element)
    # finds the coordinates of an element inside a 2 dimensional array
    # and retuns a an array ["0", "1"] pointing to where it is
    a = maze_array.map.with_index do |subarray, i|
          j = subarray.index(element)
          "#{i} #{j}" if j
        end
    # Deletes nils, re-join as seperate elements and convert to integers
    # to make it look like this [0][1]
    a.compact.join.split(" ").map(&:to_i)
  end

end
