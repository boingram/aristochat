defmodule Aristochat.RoomChannel do 
  use Phoenix.Channel

  def join("rooms:" <> room_name, body, socket) do 
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do 
    broadcast! socket, "new_msg", %{
      body: body,
      username: socket.assigns.username
    }
    {:noreply, socket}
  end

end
