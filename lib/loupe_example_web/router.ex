defmodule LoupeExampleWeb.Router do
  use LoupeExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LoupeExampleWeb do
    pipe_through :api
  end
end
