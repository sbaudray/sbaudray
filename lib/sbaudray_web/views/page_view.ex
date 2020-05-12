defmodule SbaudrayWeb.PageView do
  use SbaudrayWeb, :view

  @posts_visible 3

  def has_posts?(assigns) do
    !Enum.empty?(assigns.posts) 
  end

  def last_posts(assigns) do
    Enum.take(assigns.posts, @posts_visible)
  end

  def enough_posts?(assigns) do
    Enum.count(assigns.posts) > @posts_visible
  end
end
