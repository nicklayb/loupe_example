defmodule LoupeExampleWeb.Layouts do
  use Phoenix.Component
  alias Phoenix.Controller, as: PhoenixController
  use LoupeExampleWeb.Routes

  embed_templates "layouts/*"
end
