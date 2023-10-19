defmodule ToyRobot.Robot do
  alias ToyRobot.Robot
  defstruct [north: 0, east: 0, facing: :north]

# Function to ensure robot is moving in specified direction
  def move(%Robot{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :east -> robot |> move_east
      :south -> robot |> move_south
      :west -> robot |> move_west
    end
  end

  @doc """
  Turns the Robot left

     iex>alias ToyRobot.Robot
     ToyRobot.Robot
     iex> robot = %Robot{facing: :north}
     %Robot{facing: :north}
     iex> robot |> Robot.turn_left()
     %Robot{facing: :west}

  """
  def turn_left(%Robot{facing: facing}) do
    case facing  do
      :north -> %Robot{facing: :west}
      :east  -> %Robot{facing: :north}
      :south -> %Robot{facing: :east}
      :west  -> %Robot{facing: :south}
    end
  end

  @doc """
  Turns the robot right

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{facing: :north}
      %Robot{facing: :north}
      iex> robot |> Robot.turn_right()
      %Robot{facing: :east}
  """
  def turn_right (%Robot{facing: facing}) do
    case facing do
      :north -> %Robot{facing: :east}
      :east  -> %Robot{facing: :south}
      :south -> %Robot{facing: :west}
      :west  -> %Robot{facing: :north}
    end
  end

  defp move_north(robot) do
    %Robot{north: robot.north + 1}
  end

  defp move_east(robot) do
    %Robot{east: robot.east + 1}
  end

  defp move_west(robot) do
    %Robot{east: robot.east - 1}
  end

  defp move_south(robot) do
    %Robot{north: robot.north - 1}
  end
end
