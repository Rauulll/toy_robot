defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Table}

  def run([{:place, placement} | rest]) do
    table = %Table{north_boundary: 4, east_boundary: 4}
    case Simulation.place(table, placement) do
    {:ok, simulation} -> run(rest, simulation)
    {:error, :invalid_placement} -> run(rest)
    end
  end

  def run([_command | rest]), do: run(rest)

  def run([]), do: nil

  def run([:move | rest], simulation) do
    new_simulation = simulation
    |> Simulation.move
    |> case do
      {:ok, simulation} -> simulation
      {:error, :at_table_boundary} -> simulation
    end
    run(rest, new_simulation)
  end

  def run([:turn_right | rest], simulation) do
    {:ok, simulation} = simulation |> Simulation.turn_right
    run(rest, simulation)
  end

  def run([:turn_left | rest], simulation) do
    {:ok, simulation} = simulation |> Simulation.turn_left
    run(rest, simulation)
  end

  def run([], simulation), do: simulation
end
