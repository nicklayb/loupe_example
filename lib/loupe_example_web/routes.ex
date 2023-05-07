defmodule LoupeExampleWeb.Routes do
  @static_paths ~w(assets fonts images favicon.ico robots.txt)
  
  def static_paths, do: @static_paths

  defmacro __using__(_) do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: LoupeExampleWeb.Endpoint,
        router: LoupeExampleWeb.Router,
        statics: LoupeExampleWeb.Routes.static_paths()
    end
  end
end
