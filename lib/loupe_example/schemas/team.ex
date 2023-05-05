defmodule LoupeExample.Schemas.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias LoupeExample.Schemas.Driver
  alias LoupeExample.Schemas.Team

  schema("teams") do
    field(:name, :string)
    field(:engine, :string)

    has_many(:drivers, Driver)
  end

  @required ~w(name engine)a
  def changeset(%Team{} = team \\ %Team{}, params) do
    team
    |> cast(params, @required)
    |> cast_assoc(:drivers)
    |> validate_required(@required)
  end
end
