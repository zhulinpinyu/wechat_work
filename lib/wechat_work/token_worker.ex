defmodule WeChatWork.TokenWorker do
  use GenServer

  def start_link() do

  end

  def access_token do
    GenServer.call(:token)
  end

  #Server

  def init(%{}) do

  end

  def handle_call(:token, state) do
    {:reply, {:ok, token}, state}
  end

  #init token

  #get token

  #compare exprit date 7200 seconds, re get token
end
