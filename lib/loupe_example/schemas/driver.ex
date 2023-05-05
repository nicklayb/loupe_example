defmodule LoupeExample.Schemas.Driver do
  use Ecto.Schema
  import Ecto.Changeset
  alias LoupeExample.Schemas.Driver
  alias LoupeExample.Schemas.RacePosition
  alias LoupeExample.Schemas.Team

  schema("drivers") do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:number, :integer)
    field(:abbreviation, :string)

    belongs_to(:team, Team)

    has_many(:positions, RacePosition)
  end

  @required ~w(first_name last_name number abbreviation)a
  def changeset(%Driver{} = driver \\ %Driver{}, params) do
    driver
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:abbreviation, max: 4)
  end
end
