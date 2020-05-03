defmodule SbaudrayWeb.LayoutView do
  use SbaudrayWeb, :view

  def title(assigns) do
    Map.get(assigns, :title, "Sebastien Baudray · React & Elixir Developer")
  end

  def description(assigns) do
    Map.get(
      assigns,
      :description,
      "Hi, i'm Sébastien Baudray, a web developer building great user experiences through quality code"
    )
  end
end
