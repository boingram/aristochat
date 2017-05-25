defmodule Aristochat.RoomChannel do 
  use Phoenix.Channel

  def join("rooms:" <> room_name, body, socket) do 
    {:ok, socket}
  end

  def handle_in("chat_msg", %{"body" => body}, socket) do 
    broadcast! socket, "chat_msg", %{
      body: body,
      username: socket.assigns.username
    }
    {:noreply, socket}
  end

end
