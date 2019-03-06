defmodule WechatWork do
  alias WechatWork.TokenServer

  def token do
    TokenServer.token
  end
end
