defmodule WechatWork.MixProject do
  use Mix.Project

  def project do
    [
      app: :wechat_work,
      version: "0.1.1",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "WeChat Work",
      source_url: "https://github.com/zhulinpinyu/wechat_work"
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
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:httpoison, "~> 1.5"},
      {:jason, "~> 1.1"}
    ]
  end

  defp description do
    "WeChat Work for Elixir"
  end

  defp package do
    [
      files: ~w(lib .formatter.exs mix.exs README* config),
      maintainers: ["zhulinpinyu"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/zhulinpinyu/wechat_work"}
    ]
  end
end
