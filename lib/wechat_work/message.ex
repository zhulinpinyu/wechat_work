defmodule WechatWork.Message do
  def push(token, "@all", msg), do: push(token, ["@all"], msg)

  def push(token, user_ids, msg) do
    body = %{
      touser: Enum.join(user_ids,"|"),
      msgtype: "text",
      agentid: agentid(),
      text: %{
        content: msg
      }
    }
    WechatWork.HTTP.post(api_pathname(), body, params: %{access_token: token})
  end

  defp api_pathname(action \\ "send"), do: "/cgi-bin/message/#{action}"
  defp agentid, do: Application.get_env(:wechat_work, :agentid)
end
