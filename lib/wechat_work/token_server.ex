defmodule WechatWork.TokenServer do
  use GenServer

  @server __MODULE__

  def start_link(_) do
    GenServer.start_link(@server, :ok, name: @server)
  end

  def token do
    GenServer.call(@server, :token)
  end

  #Server

  def init(:ok) do
    state = set_current_state()
    {:ok, state}
  end

  def handle_call(:token, _from, state) do
    case lookup(state) do
      nil ->
        %{token: token} = state = set_current_state()
        {:reply, {:ok, token}, state}
      token ->
        {:reply, {:ok, token}, state}
    end
  end

  defp lookup(%{token: nil}), do: nil
  defp lookup(%{token: token, expired_at: expired_at} )do
    case Time.utc_now() > expired_at do
      true -> nil
      _ -> token
    end
  end

  defp set_current_state() do
    %{token: "token", expired_at: Time.add(Time.utc_now, 7200)}
  end

end
