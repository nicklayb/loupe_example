defmodule LoupeExampleWeb.HomeLive do
  use Phoenix.LiveView,
    layout: {LoupeExampleWeb.Layouts, :app}

  use LoupeExampleWeb.Routes
  alias Loupe.PhoenixLiveView.LiveComponent, as: LoupeLive
  alias LoupeExample.EctoDefinition, as: LoupeDefinition
  alias LoupeExample.Renderer, as: LoupeRenderer
  alias LoupeExample.Repo

  def mount(_params, _session, socket) do
    input = ~s|get all Driver where team.engine = "Mercedes"|

    socket =
      socket
      |> assign(:result, {:ok, []})
      |> assign(:input, input)

    dispatch_query(input)

    {:ok, socket}
  end

  def handle_event("query", %{"input" => input}, socket) do
    socket =
      socket
      |> assign(:input, input)
      |> assign(:result, :loading)

    dispatch_query(input)
    {:noreply, socket}
  end

  def handle_event("loupe:" <> action, %{"key" => key}, socket) do
    socket =
      update(socket, :result, fn
        {:ok, results} ->
          {:ok, LoupeLive.map_entity_at(results, key, &apply_action(action, &1, &2))}

        other ->
          other
      end)

    {:noreply, socket}
  end

  def handle_info({:query, query}, socket) do
    with {:ok, result} <- query(query) do
      socket =
        socket
        |> assign(:result, result)

      {:noreply, socket}
    else
      _ ->
        {:noreply, socket}
    end
  end

  defp apply_action("expand", key, record) do
    Repo.preload(record, [key])
  end

  defp apply_action("collapse", key, %struct{} = record) do
    new = struct!(struct)
    Map.put(record, key, Map.fetch!(new, key))
  end

  defp dispatch_query(input) do
    send(self(), {:query, input})
  end

  defp query(query) do
    {:ok, LoupeDefinition.query(query)}
  rescue
    _ ->
      :error
  end
end
