defmodule SbaudrayWeb.BlogController do
  use SbaudrayWeb, :controller

  alias Sbaudray.Blog

  def index(conn, _params) do
    posts = Blog.list_posts()

    conn
    |> index_metas()
    |> assign(:posts, posts)
    |> render("index.html")
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)

    conn |> show_metas(post) |> assign(:post, post) |> render("show.html")
  end

  defp index_metas(conn) do
    conn
    |> assign(:title, "Blog - Sebastien Baudray")
    |> assign(:description, "Articles about Elixir, React and all things web")
  end

  defp show_metas(conn, post) do
    conn |> assign(:title, post.title) |> assign(:description, post.description)
  end
end
