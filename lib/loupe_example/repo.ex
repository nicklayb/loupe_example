defmodule LoupeExample.Repo do
  use Ecto.Repo,
    otp_app: :loupe_example,
    adapter: Ecto.Adapters.Postgres
end
