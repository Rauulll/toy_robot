defmodule ToyRobot.CommandRunnerTests do
  use ExUnit.Case, async: true

  alias ToyRobot.{CommandRunner, Simulation}

  test "handles a valid placement" do
    %Simulation{robot: robot} = CommandRunner.run([{:place, %{east: 1, north: 2, facing: :north}}])

    assert robot.east == 1
    assert robot.north == 2
    assert robot.facing == :north
  end

  test "handles an invalid place command" do
    simulation = CommandRunner.run([{:place, %{east: 10, north: 10, facing: :north}}])
    assert simulation == nil
  end
end
