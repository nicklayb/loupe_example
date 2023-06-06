defmodule LoupeExample.Renderer do
  @behaviour Loupe.PhoenixLiveView.Renderer

  import Phoenix.Component

  alias LoupeExample.Schemas.Driver

  @impl Loupe.PhoenixLiveView.Renderer
  def struct_link(%Driver{} = driver, :__struct__, _) do
    path(driver)
  end

  def struct_link(%Driver{} = driver, :id, _) do
    path(driver)
  end

  def struct_link(_, _, _), do: nil

  @impl Loupe.PhoenixLiveView.Renderer
  def render_type(binary, _) when is_binary(binary) do
    assigns = %{binary: "String(#{binary})"}

    {:ok,
     ~H"""
     <em><%= @binary %></em>
     """}
  end

  def render_type(_, _) do
    :ignore
  end

  defp path(%Driver{first_name: first_name, last_name: last_name}) do
    {"https://www.formula1.com/en/drivers/#{String.downcase(first_name <> "-" <> last_name)}.html",
     target: "_blank"}
  end
end
