defmodule ToyRobot.Simulation do
  alias ToyRobot.{Robot, Table, Simulation}
  defstruct [:table, :robot]

  @doc """
  Simulates placing a robot on a table

  ##Examples

  When the robot is placed in a valid position:

      iex> alias ToyRobot.{Robot, Table, Simulation}
      [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
      iex> table = %Table{north_boundary: 4, east_boundary: 4}
      %Table{north_boundary: 4, east_boundary: 4}
      iex> Simulation.place(table, %{north: 0, east: 0, facing: :north})
      {
        :ok,
        %Simulation{
          table: table,
          robot: %Robot{north: 0, east: 0, facing: :north}
        }
      }

  When the robot is placed in an invalid position:

      iex> alias ToyRobot.{Table, Simulation}
      [ToyRobot.Table, ToyRobot.Simulation]
      iex> table = %Table{north_boundary: 4, east_boundary: 4}
      %Table{north_boundary: 4, east_boundary: 4}
      iex> Simulation.place(table, %{north: 6, east: 0, facing: :north})
      {:error, :invalid_placemnt}
  """

  def place(table, placement) do
    if table |> Table.valid_position?(placement)  do
      {
        :ok,
        %__MODULE__{
          table: table,
          robot: struct(Robot, placement),
        }
      }
    else
      {:error, :invalid_placemnt}
    end
  end
end
