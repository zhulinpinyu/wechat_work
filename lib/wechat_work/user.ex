defmodule WechatWork.User do
  alias WechatWork.HTTP

  def get(token, userid) do
    HTTP.get(api_pathname(), params: %{access_token: token, userid: userid})
  end

  def getUserInfo(token, code) do
    HTTP.get(api_pathname("getuserinfo"), params: %{access_token: token, code: code})
  end

  defp api_pathname(action \\ "get"), do: "/cgi-bin/user/#{action}"
end
