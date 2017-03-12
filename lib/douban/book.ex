defmodule Douban.Book do
  import OAuth2

  alias Douban.{Client, Book}

  def get_book_by_id(%Client{} = client, book_id) do
    OAuth2.Client.get!(client.oauth, "/book/#{book_id}")
    |> Map.fetch!(:body)
    |> Enum.reduce(%{}, fn(x, acc) ->
      {k, v} = x;
      Map.put(acc, String.to_atom(k), v) end)
  end
end