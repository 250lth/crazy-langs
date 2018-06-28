defmodule ElmOnFire.StudentsTest do
  use ElmOnFire.DataCase

  alias ElmOnFire.Students

  describe "students" do
    alias ElmOnFire.Students.Student

    @valid_attrs %{age: 42, classification: "some classification", name: "some name", subject: "some subject"}
    @update_attrs %{age: 43, classification: "some updated classification", name: "some updated name", subject: "some updated subject"}
    @invalid_attrs %{age: nil, classification: nil, name: nil, subject: nil}

    def student_fixture(attrs \\ %{}) do
      {:ok, student} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Students.create_student()

      student
    end

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert Students.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Students.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      assert {:ok, %Student{} = student} = Students.create_student(@valid_attrs)
      assert student.age == 42
      assert student.classification == "some classification"
      assert student.name == "some name"
      assert student.subject == "some subject"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Students.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      assert {:ok, student} = Students.update_student(student, @update_attrs)
      assert %Student{} = student
      assert student.age == 43
      assert student.classification == "some updated classification"
      assert student.name == "some updated name"
      assert student.subject == "some updated subject"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Students.update_student(student, @invalid_attrs)
      assert student == Students.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Students.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Students.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Students.change_student(student)
    end
  end
end
