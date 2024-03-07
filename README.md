# ToyRobot Exercise

## Description

The application is a simulation of a toy robot moving on a square tabletop, with dimensions of 5 x 5 units. There are no obstructions on the table surface. The robot can freely move around the table, but any movement that would cause the robot to fall off the table is prevented.

The application reads a file specified in the command line. The following commands are valid:

1. `PLACE X,Y,F`: Places the toy robot on the table at position X,Y, facing the specified direction (NORTH, SOUTH, EAST, or WEST).
2. `MOVE`: Moves the toy robot one unit forward in the direction it is currently facing.
3. `LEFT`: Rotates the robot 90 degrees to the left without changing its position.
4. `RIGHT`: Rotates the robot 90 degrees to the right without changing its position.
5. `REPORT`: Announces the current position (X,Y) and direction (F) of the robot.

The origin (0,0) is the southwest corner of the table. All commands are ignored until a valid `PLACE` command is executed. Commands are case-insensitive, so both uppercase and lowercase commands are accepted.

## How to test the application

**Note: The application currently does not have functionality to read from a file. More on that later. Only `MOVE`, `LEFT`, and `RIGHT` should be used for the application to return results.**

1. Navigate to the `test.exs` file.
2. Under the struct `%Robot{east: 0, north: 0, facing: :north}`, edit your commands as you desire

