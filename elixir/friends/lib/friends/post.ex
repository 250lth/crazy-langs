defmodule Friends.Post do
  @moduledoc false
  
  use Ecto.Schema

  schema "posts" do
    field :header, :string
    field :body, :string

    belongs_to :user, Friends.User

    many_to_many :tags, Friends.Tag, join_through: "posts_tags"
  end

end
