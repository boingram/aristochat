defmodule Aristochat.RoomChannelTest do 
  use Aristochat.ChannelCase
  alias Aristochat.RoomChannel

  test "messages are echoed back" do
    {:ok, _, socket} = 
      socket("", %{username: "testuser123"})
      |> subscribe_and_join(RoomChannel, "rooms:RoomChannelTest", %{})

    push socket, "new_msg", %{body: "testmsg123"}
    assert_push "new_msg", %{body: "testmsg123", username: "testuser123"}
    assert_broadcast "new_msg", %{body: "testmsg123", username: "testuser123"}
    leave socket
  end
end
