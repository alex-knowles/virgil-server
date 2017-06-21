defmodule Virgil.PoemView do
  use Virgil.Web, :view

  def render("index.json", %{poems: poems}) do
    %{data: render_many(poems, Virgil.PoemView, "poem.json")}
  end

  def render("show.json", %{poem: poem}) do
    %{data: render_one(poem, Virgil.PoemView, "poem.json")}
  end

  def render("poem.json", %{poem: poem}) do
    %{id: poem.id,
      title: poem.title,
      author: poem.author,
      collection: poem.collection,
      text: poem.text}
  end
end
