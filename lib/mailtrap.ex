defmodule Mailtrap do
  @moduledoc """
  Mailtrap API client
  """

  @doc """
  Generates client
  """
  @spec client(String.t()) :: Tesla.Client.t()
  def client(token) do
    middleware = [
      Mailtrap.DirectResponse,
      Tesla.Middleware.JSON,
      Tesla.Middleware.PathParams,
      {Tesla.Middleware.BaseUrl, "https://mailtrap.io/api"},
      {Tesla.Middleware.BearerAuth, token: token}
    ]

    Tesla.client(middleware)
  end

  @doc """
  Makes a GET request
  """
  @spec get(Tesla.Client.t(), String.t(), keyword()) :: {:ok, any()} | {:error, Tesla.Env.t()}
  def get(client, url, opts \\ []) do
    Tesla.get(client, url, opts)
  end

  @doc """
  Makes a POST request
  """
  @spec post(Tesla.Client.t(), String.t(), any(), keyword()) ::
          {:ok, any()} | {:error, Tesla.Env.t()}
  def post(client, url, body, opts \\ []) do
    Tesla.post(client, url, body, opts)
  end

  @doc """
  Makes a PUT request
  """
  @spec put(Tesla.Client.t(), String.t(), any(), keyword()) ::
          {:ok, any()} | {:error, Tesla.Env.t()}
  def put(client, url, body, opts \\ []) do
    Tesla.put(client, url, body, opts)
  end

  @doc """
  Makes a PATCH request
  """
  @spec patch(Tesla.Client.t(), String.t(), any(), keyword()) ::
          {:ok, any()} | {:error, Tesla.Env.t()}
  def patch(client, url, body, opts \\ []) do
    Tesla.patch(client, url, body, opts)
  end

  @doc """
  Makes a DELETE request
  """
  @spec delete(Tesla.Client.t(), String.t(), keyword()) :: {:ok, any()} | {:error, Tesla.Env.t()}
  def delete(client, url, opts \\ []) do
    Tesla.delete(client, url, opts)
  end
end
