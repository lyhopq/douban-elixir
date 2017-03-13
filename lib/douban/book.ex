defmodule Douban.Book do
  import OAuth2

  alias Douban.{Client, Book}

  def get_book_by_id(%Client{} = client, book_id) do
    get_book(client, "/book/#{book_id}")
  end

  def get_book_by_isbn(%Client{} = client, isbn) do
    get_book(client, "/book/isbn/#{isbn}")
  end

  defp get_book(%Client{} = client, url) do
    OAuth2.Client.get!(client.oauth, url)
    |> Map.fetch!(:body)
    |> Enum.reduce(%{}, fn(x, acc) ->
      {k, v} = x;
      Map.put(acc, String.to_atom(k), v) end)
  end
end