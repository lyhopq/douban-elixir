defmodule Douban do
  use HTTPotion.Base

  def get_book_by_id(book_id) do
    book_id
    |> process_url
    |> HTTPotion.get([:timeout, 15000])
    |> Map.fetch!(:body)
    |> :jiffy.decode
    |> unpack
    |> Enum.reduce(%{}, fn(x, acc) ->
      {k, v} = x;
      Map.put(acc, String.to_atom(k), v) end)
  end

  defp process_url(book_id) do
    book_id = if is_integer(book_id) do 
      Integer.to_string(book_id) 
    else
      book_id
    end
    "https://api.douban.com/v2/book/" <> book_id
  end

  defp unpack(pack) do
    {vaule} = pack
    vaule
  end
end