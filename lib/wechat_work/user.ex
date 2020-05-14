defmodule WechatWork.User do
  alias WechatWork.HTTP

  def get(token, userid) do
    HTTP.get(api_pathname(), params: %{access_token: token, userid: userid})
  end

  defp api_pathname(action \\ "get"), do: "/cgi-bin/user/#{action}"
end
