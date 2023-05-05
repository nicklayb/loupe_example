defmodule LoupeExample.Schemas.RacePosition do
  use Ecto.Schema
  import Ecto.Changeset
  alias LoupeExample.Schemas.Driver
  alias LoupeExample.Schemas.Race
  alias LoupeExample.Schemas.RacePosition

  schema("race_positions") do
    field(:position, :integer)

    belongs_to(:race, Race)
    belongs_to(:driver, Driver)
  end

  @required ~w(position driver_id)a
  def changeset(%RacePosition{} = race_position \\ %RacePosition{}, params) do
    race_position
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
