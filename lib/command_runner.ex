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
    {:ok, simulation} = simulation |> Simulation.move()
    run(rest, simulation)
  end

  def run([], simulation), do: simulation
end
