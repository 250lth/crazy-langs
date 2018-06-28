defmodule ElmOnFireWeb.StudentView do
  use ElmOnFireWeb, :view
  alias ElmOnFireWeb.StudentView

  def render("index.json", %{students: students}) do
    %{data: render_many(students, StudentView, "student.json")}
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, StudentView, "student.json")}
  end

  def render("student.json", %{student: student}) do
    %{id: student.id,
      name: student.name,
      age: student.age,
      subject: student.subject,
      classification: student.classification}
  end
end
