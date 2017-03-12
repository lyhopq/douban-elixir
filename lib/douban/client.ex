defmodule Douban.Client do
    import OAuth2

    alias Douban.{Client}

    defstruct oauth: nil

    def new(client \\ %Client{}, opts \\ []) do
        opts = 
            opts
            |> Keyword.put(:site, "https://api.douban.com/v2")
        struct(client, [{:oauth, OAuth2.Client.new(opts)}])
    end
end