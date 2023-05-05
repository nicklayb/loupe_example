defmodule LoupeExample.Schemas.Season do
  use Ecto.Schema
  import Ecto.Changeset
  alias LoupeExample.Schemas.Race
  alias LoupeExample.Schemas.Season

  schema("seasons") do
    field(:year, :integer)

    has_many(:races, Race)
  end

  @required ~w(year)a
  def changeset(%Season{} = season \\ %Season{}, params) do
    season
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
