defmodule Aristochat.UserSocket do use Phoenix.Socket 
  ## Channels
  channel "rooms:*", Aristochat.RoomChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  transport :longpoll, Phoenix.Transports.LongPoll

  def connect(%{"username" => username}, socket) do
    {:ok, assign(socket, :username, username)}
  end
  
  def connect(_params, socket) do
    {:ok, assign(socket, :username, Integer.to_string(:rand.uniform(99999)))}
  end

  def id(_socket), do: nil
end
