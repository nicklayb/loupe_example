defmodule LoupeExample.Schemas.Track do
  use Ecto.Schema
  import Ecto.Changeset
  alias LoupeExample.Schemas.Race
  alias LoupeExample.Schemas.Track

  schema("tracks") do
    field(:name, :string)
    field(:country, :string)

    has_many(:races, Race)
  end

  @required ~w(name country)a
  def changeset(%Track{} = track \\ %Track{}, params) do
    track
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
