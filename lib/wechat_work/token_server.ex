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
    {:ok, %{token: nil, expired_at: nil}}
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
    case DateTime.utc_now() < expired_at do
      true -> token
      _ -> nil
    end
  end

  defp set_current_state() do
    case WechatWork.HTTP.get(api_pathname(), params: %{corpid: corpid(), corpsecret: corpsecret()}) do
      {:ok, %{"access_token" => token, "errcode" => 0, "expires_in" => expires_in}} ->
        %{token: token, expired_at: DateTime.add(DateTime.utc_now, expires_in)}
      _ ->
        %{token: nil, expired_at: nil}
    end
  end

  defp api_pathname, do: "/cgi-bin/gettoken"
  defp corpid, do: Application.get_env(:wechat_work, :corpid)
  defp corpsecret, do: Application.get_env(:wechat_work, :corpsecret)
end
