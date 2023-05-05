defmodule LoupeExample.Repo.Migrations.CreateBaseTables do
  use Ecto.Migration

  def change do
    create(table("teams")) do
      add(:name, :string, null: false)
      add(:engine, :string, null: false)
    end

    create(table("drivers")) do
      add(:first_name, :string, null: false)
      add(:last_name, :string, null: false)
      add(:number, :integer, null: false)
      add(:abbreviation, :string, null: false, length: 4)
      add(:team_id, references("teams", on_delete: :nothing), null: true)
    end

    create(table("tracks")) do
      add(:name, :string, null: false)
      add(:country, :string, null: false)
    end

    create(table("seasons")) do
      add(:year, :integer, null: false)
    end

    create(table("races")) do
      add(:date, :date, null: false)
      add(:track_id, references("tracks", on_delete: :delete_all), null: false)
      add(:season_id, references("seasons", on_delete: :delete_all), null: false)
    end

    create(table("race_positions")) do
      add(:race_id, references("races", on_delete: :delete_all), null: false)
      add(:driver_id, references("drivers", on_delete: :delete_all), null: false)
      add(:position, :integer, null: false)
    end
  end
end
