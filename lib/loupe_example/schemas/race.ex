defmodule LoupeExample.Schemas.Race do
  use Ecto.Schema
  import Ecto.Changeset
  alias LoupeExample.Schemas.Race
  alias LoupeExample.Schemas.RacePosition
  alias LoupeExample.Schemas.Season
  alias LoupeExample.Schemas.Track

  schema("races") do
    field(:date, :date)

    belongs_to(:track, Track)
    belongs_to(:season, Season)

    has_many(:positions, RacePosition)
  end

  @required ~w(date track_id season_id)a
  def changeset(%Race{} = race \\ %Race{}, params) do
    race
    |> cast(params, @required)
    |> cast_assoc(:positions)
    |> validate_required(@required)
  end
end
