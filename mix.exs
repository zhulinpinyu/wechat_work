defmodule WechatWork.MixProject do
  use Mix.Project

  def project do
    [
      app: :wechat_work,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {WechatWork.Application, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.5"},
      {:jason, "~> 1.1"}
    ]
  end
end
