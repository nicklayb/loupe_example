alias LoupeExample.Repo
alias LoupeExample.Schemas.Race
alias LoupeExample.Schemas.Season
alias LoupeExample.Schemas.Team
alias LoupeExample.Schemas.Track

teams = %{
  red_bull: %{
    name: "Oracle Red Bull Racing",
    engine: "Honda RBPT",
    drivers: [
      %{first_name: "Max", last_name: "Verstappen", abbreviation: "VER", number: 1},
      %{first_name: "Sergio", last_name: "Perez", abbreviation: "PER", number: 11}
    ]
  },
  aston_martin: %{
    name: "Aston Martin Aramco Cognizant",
    engine: "Mercedes",
    drivers: [
      %{first_name: "Fernando", last_name: "Alonso", abbreviation: "ALO", number: 14},
      %{first_name: "Lance", last_name: "Stroll", abbreviation: "STR", number: 18}
    ]
  },
  mercedes: %{
    name: "Mercedes-AMG PETRONAS F1",
    engine: "Mercedes",
    drivers: [
      %{first_name: "Lewis", last_name: "Hamilton", abbreviation: "HAM", number: 44},
      %{first_name: "George", last_name: "Russel", abbreviation: "RUS", number: 63}
    ]
  },
  ferrari: %{
    name: "Scuderia Ferrari",
    engine: "Ferrari",
    drivers: [
      %{first_name: "Charles", last_name: "Leclerc", abbreviation: "LEC", number: 16},
      %{first_name: "Carlos", last_name: "Sainz", abbreviation: "SAI", number: 55}
    ]
  },
  mclaren: %{
    name: "McLaren F1 Team",
    engine: "Mercedes",
    drivers: [
      %{first_name: "Lando", last_name: "Norris", abbreviation: "NOR", number: 4},
      %{first_name: "Oscar", last_name: "Piastri", abbreviation: "PIA", number: 81}
    ]
  },
  alpine: %{
    name: "BWT Alpine F1 Team",
    engine: "Renault",
    drivers: [
      %{first_name: "Pierre", last_name: "Gasly", abbreviation: "GAS", number: 10},
      %{first_name: "Esteban", last_name: "Ocon", abbreviation: "OCO", number: 31}
    ]
  },
  haas: %{
    name: "MoneyGram Haas F1 Team",
    engine: "Ferrari",
    drivers: [
      %{first_name: "Kevin", last_name: "Magnussen", abbreviation: "MAG", number: 20},
      %{first_name: "Nico", last_name: "Hulkenberg", abbreviation: "HUL", number: 27}
    ]
  },
  alfa_romeo: %{
    name: "Alfa Romeo F1 Team Stake",
    engine: "Ferrari",
    drivers: [
      %{first_name: "Valtteri", last_name: "Bottas", abbreviation: "BOT", number: 78},
      %{first_name: "Zhou", last_name: "Guanyu", abbreviation: "ZHO", number: 24}
    ]
  },
  alpha_tauri: %{
    name: "Scuderia AlphaTauri",
    engine: "Honda RBPT",
    drivers: [
      %{first_name: "Yuki", last_name: "Tsunoda", abbreviation: "TSU", number: 22},
      %{first_name: "Nyck", last_name: "De Vries", abbreviation: "DEV", number: 21}
    ]
  },
  wiliams: %{
    name: "Wiliams Racing",
    engine: "Mercedes",
    drivers: [
      %{first_name: "Alexander", last_name: "Albon", abbreviation: "ALB", number: 23},
      %{first_name: "Logan", last_name: "Sargeant", abbreviation: "SAR", number: 2}
    ]
  }
}

teams =
  Enum.map(teams, fn {key, team} ->
    changeset = Team.changeset(team)

    {key, Repo.insert!(changeset)}
  end)

drivers =
  Enum.reduce(teams, %{}, fn {_, team}, acc ->
    team
    |> Repo.preload([:drivers])
    |> Map.fetch!(:drivers)
    |> Enum.reduce(acc, fn driver, acc ->
      Map.put(acc, driver.abbreviation, driver)
    end)
  end)

tracks = %{
  bahrain: %{name: "Gulf Air Bahrain", country: "Bahrain"},
  saudi: %{name: "STC Saudi Arabian", country: "Saudi Arabia"},
  australia: %{name: "Rolex Autralian", country: "Australia"},
  baku: %{name: "Azerbaijan", country: "Azerbaijan"},
  miami: %{name: "Crypto.com Miami", country: "United States"}
}

tracks =
  Enum.reduce(tracks, %{}, fn {key, track}, acc ->
    changeset = Track.changeset(track)

    Map.put(acc, key, Repo.insert!(changeset))
  end)

season =
  %{year: 2023}
  |> Season.changeset()
  |> Repo.insert!()

races = [
  %{
    track: :bahrain,
    date: "2023-03-05",
    positions: [
      "VER",
      "PER",
      "ALO",
      "SAI",
      "HAM",
      "STR",
      "RUS",
      "BOT",
      "GAS",
      "ALB",
      "TSU",
      "SAR",
      "MAG",
      "DEV",
      "HUL",
      "ZHO",
      "NOR",
      "OCO",
      "LEC",
      "PIA"
    ]
  },
  %{
    track: :saudi,
    date: "2023-03-19",
    positions: [
      "PER",
      "VER",
      "ALO",
      "RUS",
      "HAM",
      "SAI",
      "LEC",
      "OCO",
      "GAS",
      "MAG",
      "TSU",
      "HUL",
      "ZHO",
      "DEV",
      "PIA",
      "SAR",
      "NOR",
      "BOT",
      "ALB",
      "STR"
    ]
  },
  %{
    track: :australia,
    date: "2023-04-02",
    positions: [
      "VER",
      "HAM",
      "ALO",
      "STR",
      "PER",
      "NOR",
      "HUL",
      "PIA",
      "ZHO",
      "TSU",
      "BOT",
      "SAI",
      "GAS",
      "OCO",
      "DEV",
      "SAR",
      "MAG",
      "RUS",
      "ALB",
      "LEC"
    ]
  },
  %{
    track: :baku,
    date: "2023-04-30",
    positions: [
      "PER",
      "VER",
      "LEC",
      "ALO",
      "SAI",
      "HAM",
      "STR",
      "RUS",
      "NOR",
      "TSU",
      "PIA",
      "ALB",
      "MAG",
      "GAS",
      "OCO",
      "SAR",
      "HUL",
      "BOT",
      "ZHO",
      "DEV"
    ]
  },
  %{
    track: :miami,
    date: "2023-05-07",
    positions: [
      "VER",
      "PER",
      "ALO",
      "RUS",
      "SAI",
      "HAM",
      "LEC",
      "GAS",
      "OCO",
      "MAG",
      "TSU",
      "STR",
      "BOT",
      "ALB",
      "HUL",
      "ZHO",
      "NOR",
      "DEV",
      "PIA",
      "SAR"
    ]
  }
]

Enum.reduce(races, %{}, fn params, acc ->
  positions =
    Enum.with_index(params.positions, fn abbreviation, index ->
      %{position: index + 1, driver_id: Map.fetch!(drivers, abbreviation).id}
    end)

  track = Map.fetch!(tracks, params.track)

  race =
    params
    |> Map.put(:track_id, track.id)
    |> Map.put(:positions, positions)
    |> Map.put(:season_id, season.id)
    |> Race.changeset()
    |> Repo.insert!()

  Map.put(acc, params.track, race)
end)
