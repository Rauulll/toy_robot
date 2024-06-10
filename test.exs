alias ToyRobot.Robot

%Robot{east: 0, north: 0, facing: :north}
# Give list of commands as desired i.e. .move, .turn_left, .turn_right
|> Robot.move
|> Robot.turn_right
|> IO.inspect
