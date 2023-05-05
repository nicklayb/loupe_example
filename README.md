# LoupeExample

App that includes a couple of sample data to test and play around with [Loupe](https://github.com/nicklayb/loupe).

## Setup

1. Boot the database `docker-compose up -d`.
2. Initialize the database `mix ecto.reset`.
3. Start the server and play around `iex -S mix phx.server`.

You can then attempt to run query with:

```elixir
alias LoupeExample.EctoDefinition, as: Def

Def.query(~s|get Driver where driver.positions.position = 1|)
```

The above query should return every driver that finished first in the 2023 Formula 1 season (as of May 5th).
