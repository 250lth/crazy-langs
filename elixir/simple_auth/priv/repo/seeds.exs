# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SimpleAuth.Repo.insert!(%SimpleAuth.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

SimpleAuth.Repo.delete_all SimpleAuth.User

SimpleAuth.User.changeset(%SimpleAuth.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> SimpleAuth.Repo.insert!
|> Coherence.ControllerHelpers.confirm!
