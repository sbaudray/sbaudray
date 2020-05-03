defmodule Sbaudray.Blog do
  alias Sbaudray.Blog.Post

  for app <- [:earkmark, :yaml_front_matter] do
    Application.ensure_all_started(app)
  end

  posts_paths = "blog_posts/**/*.md" |> Path.wildcard() |> Enum.sort()

  posts =
    for post_path <- posts_paths do
      @external_resource Path.relative_to_cwd(post_path)
      Post.parse!(post_path)
    end
    |> Enum.filter(&(&1.published == true))

  @posts posts

  defmodule NotFoundError do
    defexception [:message, plug_status: 404]
  end

  def list_posts do
    @posts
  end

  def last_posts do
    @posts |> Enum.take(3)
  end

  def get_post!(id) do
    case Enum.find(@posts, &(&1.id == id)) do
      nil -> raise NotFoundError
      post -> post
    end
  end
end
