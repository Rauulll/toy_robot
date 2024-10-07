alias ToyRobot.Robot

%Robot{east: 0, north: 0, facing: :north}
|> Robot.move
|> Robot.turn_right
|> IO.inspect
