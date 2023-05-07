defmodule LoupeExampleWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :loupe_example

  @session_options [
    store: :cookie,
    key: "_loupe_example_key",
    signing_salt: "z1aoOvCj",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :loupe_example,
    gzip: false,
    only: LoupeExampleWeb.Routes.static_paths()

  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :loupe_example
  end

  plug Plug.RequestId

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug LoupeExampleWeb.Router
end
