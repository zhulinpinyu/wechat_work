defmodule WechatWork do
  alias WechatWork.HTTP

  def push(user_ids, msg) do
    HTTP.push(user_ids, msg)
  end
end
