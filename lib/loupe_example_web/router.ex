defmodule LoupeExampleWeb.Router do
  use Phoenix.Router, helpers: false

  import Plug.Conn
  import Phoenix.LiveView.Router

  pipeline(:live_views) do
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {LoupeExampleWeb.Layouts, :root})
    plug(:protect_from_forgery)
  end

  scope("/", LoupeExampleWeb) do
    pipe_through(:live_views)
    live("/", HomeLive)
  end
end
