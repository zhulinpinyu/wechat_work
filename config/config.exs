use Mix.Config

config :wechat_work,
  corpid: System.get_env("WECHAT_WORK_CORPID"),
  corpsecret: System.get_env("WECHAT_WORK_CORPSECRET")

# You can configure your application as:
#
#     config :wechat_work, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:wechat_work, :key)
#
# You can also configure a third-party app:
#
#     config :logger, level: :info
#
