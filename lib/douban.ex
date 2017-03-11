defmodule Douban do
  use HTTPotion.Base

  def process_url(book_id) do
    if is_integer(book_id) do
      # FIXME: complie waring
      book_id = Integer.to_string(book_id)
    end
    "https://api.douban.com/v2/book/" <> book_id
  end
  
  def get_book(book_id) do
    url = process_url(book_id)
    IO.puts "Getting data from #{url}"
    response = HTTPotion.get(url, [:timeout, 15000])

    json = :jiffy.decode response.body
    {[
      {"rating", rating},
      {"subtitle", subtitle},
      {"author", author},
      {"pubdate", pubdate},
      {"tags", tags},
      {"origin_title", origin_title},
      {"image", image},
      {"binding", binding},
      {"translator", translator},
      {"catalog", catalog},
      {"ebook_url", ebook_url},
      {"pages", pages},
      {"images", images},
      {"alt", alt},
      {"id", id},
      {"publisher", publisher},
      {"isbn10", isbn10},
      {"isbn13", isbn13},
      {"title", title},
      {"url", url},
      {"alt_title", alt_title},
      {"author_intro", author_intro},
      {"summary", summary},
      {"ebook_price", ebook_price},
      {"series", series},
      {"price", price}
    ]} = json
    %{
      rating: rating,
      subtitle: subtitle,
      author: author,
      pubdate: pubdate,
      tags: tags,
      origin_title: origin_title,
      image: image,
      binding: binding,
      translator: translator,
      catalog: catalog,
      pages: pages,
      images: images,
      alt: alt,
      id: id,
      publisher: publisher,
      isbn10: isbn10, 
      isbn13: isbn13,
      title: title,
      url: url,
      alt_title: alt_title,
      author_intro: author_intro,
      summary: summary,
      price: price,
      json: json
    }
  end
end