defmodule Virgil.PoemController do
  use Virgil.Web, :controller

  alias Virgil.Poem

  def index(conn, _params) do
    poems = Repo.all(Poem)
    render(conn, "index.json", poems: poems)
  end

  def create(conn, %{"poem" => poem_params}) do
    changeset = Poem.changeset(%Poem{}, poem_params)

    case Repo.insert(changeset) do
      {:ok, poem} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", poem_path(conn, :show, poem))
        |> render("show.json", poem: poem)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Virgil.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    poem = Repo.get!(Poem, id)
    render(conn, "show.json", poem: poem)
  end

  def update(conn, %{"id" => id, "poem" => poem_params}) do
    poem = Repo.get!(Poem, id)
    changeset = Poem.changeset(poem, poem_params)

    case Repo.update(changeset) do
      {:ok, poem} ->
        render(conn, "show.json", poem: poem)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Virgil.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poem = Repo.get!(Poem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(poem)

    send_resp(conn, :no_content, "")
  end
end
