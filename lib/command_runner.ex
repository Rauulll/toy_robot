defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Table}

  def run([{:place, placement} | _rest]) do
    table = %Table{north_boundary: 4, east_boundary: 4}
    {:ok, simulation} = Simulation.place(table, placement)
    simulation
  end
end
