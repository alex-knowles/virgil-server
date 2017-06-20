defmodule Virgil.PoemTest do
  use Virgil.ModelCase

  alias Virgil.Poem

  @valid_attrs %{author: "some content", collection: "some content", text: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Poem.changeset(%Poem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Poem.changeset(%Poem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
