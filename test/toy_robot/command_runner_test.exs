defmodule ToyRobot.CommandRunnerTests do
  use ExUnit.Case, async:

  import ExUnit.CaptureIO

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

  test "handles a place + invalid command" do
    %Simulation{robot: robot} = [
      {:place, %{east: 1, north: 4, facing: :north}},
      :move
    ] |> CommandRunner.run()

    assert robot.east == 1
    assert robot.north == 4
    assert robot.facing == :north
  end

  test "handles a place + turn_left command" do
    %Simulation{robot: robot} = [
      {:place, %{east: 1, north: 2, facing: :north}},
      :turn_left
    ] |> CommandRunner.run()

    assert robot.east == 1
    assert robot.north == 2
    assert robot.facing == :west
  end

  test "handles a place + turn_right command" do
    %Simulation{robot: robot} = [
      {:place, %{east: 1, north: 2, facing: :north}},
      :turn_right
    ] |> CommandRunner.run()

    assert robot.east == 1
    assert robot.north == 2
    assert robot.facing == :east
  end

  test "handles a place + report command" do
    commands = [
      {:place, %{east: 1, north: 2, facing: :north}},
      :report
    ]

    output = capture_io fn ->
      CommandRunner.run(commands)
    end

    assert output |> String.trim == "The robot is at (1, 2) and is facing NORTH"
  end

  test "handles a place + invalid commands" do
    %Simulation{robot: robot} = [
      {:place, %{east: 1, north: 2, facing: :north}},
      {:invalid, "EXTERMINATE"}
    ] |> CommandRunner.run()

   assert robot.east == 1
   assert robot.north == 2
   assert robot.facing == :north
  end
end
