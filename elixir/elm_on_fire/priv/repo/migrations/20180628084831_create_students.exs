defmodule ElmOnFire.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :age, :integer
      add :subject, :string
      add :classification, :string

      timestamps()
    end

  end
end
