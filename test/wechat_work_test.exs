defmodule WechatWorkTest do
  use ExUnit.Case
  doctest WechatWork

  test "fetch token success" do
    assert {:ok, _} = WechatWork.TokenServer.token()
  end

  test "push text message success" do
    assert {:ok, _} = WechatWork.push("@all", "就是测试一下")
  end

  test "get userInfo" do
    assert {:ok, _} = WechatWork.user("MuLiXiang")
  end
end
