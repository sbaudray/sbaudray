defmodule SbaudrayWeb.PageController do
  use SbaudrayWeb, :controller

  alias Sbaudray.Blog

  def index(conn, _params) do
    last_posts = Blog.last_posts()
    IO.inspect(last_posts)

    conn
    |> assign(:last_posts, last_posts)
    |> render("index.html")
  end
end
