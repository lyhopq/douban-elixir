defmodule Douban do
  use HTTPotion.Base

  def get_book(book_id) do
    url = process_url(book_id)
    IO.puts "Getting data from #{url}"
    response = HTTPotion.get(url, [:timeout, 15000])
    
    {json} = :jiffy.decode response.body
    Enum.reduce(json, %{}, fn(x, acc) -> 
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
end