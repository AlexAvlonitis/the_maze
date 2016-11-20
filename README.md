# The Maze Solver

## What is it?

The maze solver is a program made in Ruby that can solve a maze, represented as a 2 dimensional array. Using the recursive algorithm, but it can be expanded to include any other algorithms we like.

## Build Process

I tried to use a SOLID and DRY approach for this build.

I created Unit and a Feature tests (end to end test) using Rspec. The feature test is using all the classes without mocks and stubs, to see how the program behaves under real scenarios. Also it helps to understand how to use this program.

Every class has a single responsibility and they are not tighly coupled with each other, meaning we can replace any class with another one as long as they respond to the same public interface.
Also every method within a class follows the SRP that adds an extra benefit of making the code readable, requiring less comments (ruby code should speak for itself).

## A simple UML diagram
A simple UML to understand the objects' flow

![maze uml](/maze_uml.png)


## How to use it use it
First navigate at the root of the program ./the_maze

**MAZE FILE REQUIREMENTS**

The maze file should have an extension of .maze and shoud be placed under lib/maze_files

The structure of the maze should be like that:

```
____G__X
___XXX__
X______X
__XXXX__
___X____
__S__X__
```
Where:
'G' = Goal, 'S' = Start, 'X' = Wall, '\_' = Path

**IRB COMMANDS**

```
irb(main):002:0> require './lib/maze'
=> true
irb(main):003:0> maze = Maze.build
=> #<Maze:0x0055dc8ab4a3b8 @maze_loader=#<MazeLoader:0x0055dc8ab4a5c0 @maze_file="harder.maze">, @maze_array_checker=#<MazeArrayChecker:0x0055dc8b0a7ae0 @maze_array=[["_", "_", "_", "_", "_", "_", "_", "X", "_", "_", "X"], ["_", "_", "_", "X", "X", "X", "_", "_", "_", "_", "_"], ["X", "X", "X", "G", "_", "_", "_", "X", "_", "_", "_"], ["_", "_", "X", "X", "X", "X", "X", "_", "_", "_", "_"], ["_", "_", "_", "X", "_", "_", "_", "_", "_", "X", "_"], ["_", "_", "S", "_", "_", "X", "_", "_", "_", "_", "_"]]>>
irb(main):004:0> maze_solver = MazeSolver.build(maze.map, 'recursive')
=> #<MazeSolver:0x0055dc8b0ad238 @algorithm=#<RecursiveAlgorithm:0x0055dc8b0ad4b8 @maze_array=[["_", "_", "_", "_", "_", "_", "_", "X", "_", "_", "X"], ["_", "_", "_", "X", "X", "X", "_", "_", "_", "_", "_"], ["X", "X", "X", "G", "_", "_", "_", "X", "_", "_", "_"], ["_", "_", "X", "X", "X", "X", "X", "_", "_", "_", "_"], ["_", "_", "_", "X", "_", "_", "_", "_", "_", "X", "_"], ["_", "_", "S", "_", "_", "X", "_", "_", "_", "_", "_"]], @starting_point=[5, 2]>>
irb(main):005:0> maze_solver.solve
Goal at [2][3]
Solved!
Path followed:
[[5, 2], [5, 3], [5, 4], [4, 4], [4, 5], [4, 6], [5, 6], [5, 7], [4, 7], [3, 7], [3, 8], [2, 8], [1, 8], [1, 7], [1, 6], [2, 6], [2, 5], [2, 4]]
```
**Exaplanation of each command:**
* maze = Maze.build

You can include a maze file Maze.build('mymaze.maze'),
by placing it into the maze_files directory
Or leave it blank like the example, to use the default generated one.
If the build method is used, then the maze_loader class will be used, otherwise you can do Maze.new(my_own_loader), to use your own loader class.
Maze class will return the maze_file if it's loaded correctly and passed the integrity checks.
Public interface of Maze is :map that returns the converted map file into an array

* maze_solver = MazeSolver.build(maze.map, 'recursive')

You build MazeSolver using the build method so it can include (dependency injection) the algorithm we want to use and the maze array created from the first step. At this point we only have the recursive algorithm, MazeSolver calls the algorithm passing the array to it as well, and is ready to call .solve to actually start solving the maze

* maze_solver.solve

## Testing

First navigate at the root of the program ./the_maze and to run all the unit tests you need to type:
```
rspec
```
And to run the Feature test you need to type:
```
rspec spec/features/the_maze_feature_spec.rb
```

## Helpful links
https://en.wikipedia.org/wiki/Maze_solving_algorithm

https://www.cs.bu.edu/teaching/alg/maze/

*DI: http://solnic.eu/2013/12/17/the-world-needs-another-post-about-dependency-injection-in-ruby.html
