defmodule Todos.TodoTest do
  use Todos.ModelCase

  alias Todos.Todo

  @valid_attrs %{description: "some content", done: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Todo.changeset(%Todo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Todo.changeset(%Todo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
