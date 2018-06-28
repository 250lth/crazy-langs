defmodule ElmOnFire.Students.Student do
  use Ecto.Schema
  import Ecto.Changeset


  schema "students" do
    field :age, :integer
    field :classification, :string
    field :name, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:name, :age, :subject, :classification])
    |> validate_required([:name, :age, :subject, :classification])
  end
end
