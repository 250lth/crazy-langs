defmodule Friends.Tag do
  @moduledoc false

  use Ecto.Schema

  schema "tags" do
    field :name, :string

    many_to_many :posts, Friends.Post, join_through: "posts_tags"
  end

end
