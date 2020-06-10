defmodule WechatWork do
  alias WechatWork.{Message, User}

  def push(user_ids, msg) do
    Message.push(token(), user_ids, msg)
  end

  def auth(code) do
    User.auth(token(), code)
  end

  def user(userid) do
    User.get(token(), userid)
  end

  defp token do
    {:ok, value} = WechatWork.TokenServer.token()
    value
  end
end
