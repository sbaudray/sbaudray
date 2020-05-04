defmodule Sbaudray.Blog.Post do
  @enforce_keys [:id, :published, :date, :title, :author, :description, :tags, :body]
  defstruct [:id, :published, :date, :title, :author, :description, :tags, :body]

  def parse!(filename) do
    IO.inspect(filename)
    [_dir, year, month_day_id] = Path.split(filename)
    [month, day, id_with_md] = String.split(month_day_id, "-", parts: 3)

    id = Path.rootname(id_with_md)

    date = Date.from_iso8601!("#{year}-#{month}-#{day}")

    {{:ok,
      %{
        "published" => published,
        "author" => author,
        "title" => title,
        "description" => description,
        "tags" => tags
      }}, body} = YamlFrontMatter.parse_file!(filename)

    tags = tags |> String.split(",") |> Enum.map(&String.trim/1) |> Enum.sort()

    struct!(__MODULE__,
      id: id,
      published: published,
      date: date,
      title: title,
      author: author,
      description: description,
      tags: tags,
      body: Earmark.as_html!(body, %Earmark.Options{code_class_prefix: "language-"})
    )
  end
end
