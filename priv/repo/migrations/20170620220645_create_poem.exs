defmodule Virgil.Repo.Migrations.CreatePoem do
  use Ecto.Migration

  def change do
    create table(:poems) do
      add :title, :string
      add :author, :string
      add :collection, :string
      add :text, :text

      timestamps()
    end

  end
end
