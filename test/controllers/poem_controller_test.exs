defmodule Virgil.PoemControllerTest do
  use Virgil.ConnCase

  alias Virgil.Poem
  @valid_attrs %{author: "some content", collection: "some content", text: "some content", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, poem_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    poem = Repo.insert! %Poem{}
    conn = get conn, poem_path(conn, :show, poem)
    assert json_response(conn, 200)["data"] == %{"id" => poem.id,
      "title" => poem.title,
      "author" => poem.author,
      "collection" => poem.collection,
      "text" => poem.text}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, poem_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, poem_path(conn, :create), poem: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Poem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, poem_path(conn, :create), poem: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    poem = Repo.insert! %Poem{}
    conn = put conn, poem_path(conn, :update, poem), poem: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Poem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    poem = Repo.insert! %Poem{}
    conn = put conn, poem_path(conn, :update, poem), poem: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    poem = Repo.insert! %Poem{}
    conn = delete conn, poem_path(conn, :delete, poem)
    assert response(conn, 204)
    refute Repo.get(Poem, poem.id)
  end
end
