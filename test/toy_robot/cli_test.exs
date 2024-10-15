defmodule ToyRobot.CliTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test "provides usage instruction when no args are provided" do
    output = capture_io fn  ->
      ToyRobot.CLI.main([])
    end

    assert output |> String.trim() == "Usage: toy_robot commands.txt"
  end

  test "provides usage instructions if too many args specifies" do
    output = capture_io fn  ->
      ToyRobot.CLI.main(["command_1.txt", "command_2.txt"])
    end

    assert output |> String.trim() == "Usage: toy_robot commands.txt"
   end

  test "shows an error message if the file does not exist" do
    output = capture_io fn  ->
      ToyRobot.CLI.main(["i_do_not_exist.txt"])
    end

    assert output |> String.trim() == "The file i_do_not_exist.txt does not exist"
  end

  test "handles commands and reports successfully" do
    command_path = Path.expand("test/fixtures/commands.txt", File.cwd!)

    output = capture_io fn  ->
      ToyRobot.CLI.main([command_path])
    end

    expected_output = """
      The robot is at (0, 4) and is facing NORTH
    """

    assert output |> String.trim() == expected_output |> String.trim()
  end
end
