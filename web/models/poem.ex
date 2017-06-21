defmodule Virgil.Poem do
  use Virgil.Web, :model

  schema "poems" do
    field :title, :string
    field :author, :string
    field :collection, :string
    field :text, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :author, :collection, :text])
    |> validate_required([:title, :author, :collection, :text])
  end
end
