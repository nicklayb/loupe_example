alias LoupeExample.EctoDefinition
alias LoupeExample.Repo
alias LoupeExample.Schemas.Driver
alias LoupeExample.Schemas.Season
alias LoupeExample.Schemas.Race
alias LoupeExample.Schemas.RacePosition
alias LoupeExample.Schemas.Track
alias LoupeExample.Schemas.Team

Enum.each(EctoDefinition.schemas(%{}), fn {_, struct} -> struct!(struct) end)
