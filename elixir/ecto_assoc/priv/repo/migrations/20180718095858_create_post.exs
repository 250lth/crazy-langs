defmodule EctoAssoc.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :header, :string
      add :body, :string
    end
  end
end
