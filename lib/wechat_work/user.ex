defmodule WechatWork.User do
  alias WechatWork.HTTP
  require Logger

  def get(token, userid) do
    HTTP.get(api_pathname(), params: %{access_token: token, userid: userid})
  end

  def auth(token, code) do
    with {:ok, %{"UserId" => userid}} <- HTTP.get(api_pathname("getuserinfo"), params: %{access_token: token, code: code})
    do
      get(token, userid)
    else
      err ->
        Logger.error(fn -> "Error: #{inspect(err)}, token: #{token}, code: #{code}" end)
        {:error, "invalid code"}
    end
  end

  defp api_pathname(action \\ "get"), do: "/cgi-bin/user/#{action}"
end
