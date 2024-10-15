File.stream!("commands.txt")
|> Enum.map(&String.trim/1)
|> ToyRobot.CommandInterpreter.interpret
|> ToyRobot.CommandRunner.run
