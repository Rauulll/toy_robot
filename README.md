# ToyRobot Exercise

## Description

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 x 5 units. 
There are no other obstructions on the table surface. The robot is free to roam around
the surface of the table. Any movement that would result in the robot falling from the table is
prevented, however further valid movement commands are still allowed.

The application reads a file using a name passed in the command line, the Ifollowing commands
are valid:
```
  1. PLACE X,Y,F
  2. MOVE
  3. LEFT
  4. RIGHT
  5. REPORT
```
  1. PLACE will put the toy robot on the table in position X,Y and facing NORTH SOUTH, EAST or WEST.
  2. The origin (0,0) is the SOUTH WEST most corner.
  3. All commands are ignored until a valid PLACE is made.
  4. MOVE will move the toy robot one unit forward in the direction it is Icurrently facing.
  5. LEFT and RIGHT rotates the robot 90 degrees in the specified direction Iwithout changing the position of the robot.
  6. REPORT announces the X,Y and F of the robot.


The file is assumed to have ASCII encoding. It is assumed that the PLACE command has only one
space, that is PLACE 1, 2, NORTH is an invalid command. All commands must be in uppercase, all
lower and mixed case commands will be ignored.

## How to test the application

### NB:The application currently does not have functionalities to read from file. More on that later.
###    Only `move`,`turn_right`, `turn_left` should be used for the application to return results.

  1. Navigate to the `test.exs` file
  2. Under the struct `%Robot{east: 0, north: 0, facing: :north}` edit your commands as shown below:
    ```elixir
    Robot.move
    Robot.turn_left
    Robot.move
    Robot.turn_right.
    IO.inspect
    ```
  3. Run `mix run test.exs` in the terminal to display the position and the direction is facing.
