defmodule SbaudrayWeb.PageController do
  use SbaudrayWeb, :controller

  alias Sbaudray.Blog

  def index(conn, _params) do
    posts = Blog.list_posts()

    conn
    |> assign(:posts, posts)
    |> render("index.html")
  end
end
