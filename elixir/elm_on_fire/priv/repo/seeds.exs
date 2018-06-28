# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElmOnFire.Repo.insert!(%ElmOnFire.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ElmOnFire.Students.Student
alias ElmOnFire.Repo

students = [
  %{name: "James T Kirk", age: 30, subject: "Humility", classification: "Masters"},
  %{name: "Jean-Luc Picard", age: 40, subject: "Hair Dressing", classification: "BTEC"},
  %{name: "Kathryn Janeway", age: 35, subject: "Map Reading", classification: "BSc"}
]

students
|> Enum.each(fn student ->
  %Student{} |> Student.changeset(student) |> Repo.insert!
end)
