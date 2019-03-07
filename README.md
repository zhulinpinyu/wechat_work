# WechatWork

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `wechat_work` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:wechat_work, "~> 0.1.0"}
  ]
end
```

## usage

```elixir
def application do
  [
    extra_applications: [:logger],
    mod: {WechatWork.Application, []}
  ]
end

WechatWork.push("@all", "测试一下")
```

be found at [https://hexdocs.pm/wechat_work](https://hexdocs.pm/wechat_work).
