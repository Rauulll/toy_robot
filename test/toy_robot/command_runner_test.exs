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
    assert simulation == simulation
  end

  test "ignore all commands untill a valid placement" do
    %Simulation{robot: robot} = [
      :move,
      {:place, %{east: 1, north: 2, facing: :north}}
    ] |> CommandRunner.run()

    assert robot.east == 1
    assert robot.north == 2
    assert robot.facing == :north
  end

  test "handles a place + move command" do
    %Simulation{robot: robot} = [
      {:place, %{east: 1, north: 2, facing: :north}},
      :move
    ] |> CommandRunner.run()

    assert robot.east == 1
    assert robot.north == 3
    assert robot.facing == :north
  end
end
