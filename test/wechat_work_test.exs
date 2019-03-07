defmodule WechatWorkTest do
  use ExUnit.Case
  doctest WechatWork

  test "fetch token success" do
    assert {:ok, _} = WechatWork.token()
  end
end
