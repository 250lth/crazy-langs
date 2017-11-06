defmodule Friends.User do
  @moduledoc false
  
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    has_one :avatar, Friends.Avatar
    has_many :posts, Friends.Post
  end

end
