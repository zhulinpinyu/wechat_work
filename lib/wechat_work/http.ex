defmodule WechatWork.HTTP do
  require Logger

  def post(pathname, body, opts) do
    case HTTPoison.post(url(pathname, opts), Jason.encode!(body)) do
      {:ok, %HTTPoison.Response{status_code: 200} = res} ->
        {:ok, res}
      err ->
        err_msg = "Failed post info, reason: #{inspect err}"
        Logger.error(fn -> err_msg end)
        {:error, err_msg}
    end
  end

  def get(pathname, opts) do
    case HTTPoison.get(url(pathname, opts)) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        Jason.decode(body)
      err ->
        err_msg = "Failed fetch info, reason: #{inspect err}"
        Logger.error(fn -> err_msg end)
        {:error, err_msg}
    end
  end

  defp url(pathname, opts) do
    params= Keyword.get(opts, :params, %{})
    api_hostname() <> pathname <> "?" <> URI.encode_query(params)
  end

  defp api_hostname, do: "https://qyapi.weixin.qq.com"
end
