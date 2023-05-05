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

The above query 

### Query examples

#### All teams where a driver had a podium (finished P3 or higher)

```
get all Team where drivers.positions.position <= 3
```

#### All driver from Aston Martin

```
get all Driver where team.name like "Aston Martin"
```

#### All tracks where Fernando Alonso finished 3rd

```
get all Track where races.positions.position = 3 and races.positions.driver.abbreviation = "ALO"
```

#### All tracks before April

```
get all Track where races.date < "2023-04-01"
```
