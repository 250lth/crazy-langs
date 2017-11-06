defmodule Friends.Avatar do
  @moduledoc false
  
  use Ecto.Schema

  schema "avatars" do
    field :nick_name, :string
    field :pic_url, :string
    belongs_to :user, Friends.User
  end

end
