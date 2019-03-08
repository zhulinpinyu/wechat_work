# WechatWork

## Installation

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

Notes: **please setup env params** `./envrc.sample`

Doc: [https://work.weixin.qq.com/api/doc#90001/90143/91201](https://work.weixin.qq.com/api/doc#90001/90143/91201)

Be found at [https://hexdocs.pm/wechat_work](https://hexdocs.pm/wechat_work).
