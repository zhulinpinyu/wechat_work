defmodule WechatWork.HTTP do
  def push("@all", msg), do: push(["@all"], msg)

  def push(user_ids, msg) do
    body = %{
      touser: Enum.join(user_ids,"|"),
      msgtype: "text",
      agentid: agentid(),
      text: %{
        content: msg
      }
    }
    HTTPoison.post(url(), Jason.encode!(body))
  end

  defp url do
    {:ok, token} = WechatWork.TokenServer.token()
    "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=#{token}"
  end

  defp agentid, do: Application.get_env(:wechat_work, :agentid)
end
