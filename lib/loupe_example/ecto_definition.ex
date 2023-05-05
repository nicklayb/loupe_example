defmodule LoupeExample.EctoDefinition do
  @behaviour Loupe.Ecto.Definition

  alias LoupeExample.EctoDefinition
  alias LoupeExample.Repo
  alias LoupeExample.Schemas.Driver
  alias LoupeExample.Schemas.Season
  alias LoupeExample.Schemas.Race
  alias LoupeExample.Schemas.RacePosition
  alias LoupeExample.Schemas.Track
  alias LoupeExample.Schemas.Team

  @schemas %{
    "Driver" => Driver,
    "Season" => Season,
    "Race" => Race,
    "RacePosition" => RacePosition,
    "Track" => Track,
    "Team" => Team
  }

  @impl Loupe.Ecto.Definition
  def schemas(_), do: @schemas

  @impl Loupe.Ecto.Definition
  def schema_fields(_, _), do: :all

  @impl Loupe.Ecto.Definition
  def scope_schema(schema, _), do: schema

  def query(query, context \\ %{}) do
    with {:ok, query, _context} <- Loupe.Ecto.build_query(query, EctoDefinition, context) do
      Repo.all(query)
    end
  end
end
