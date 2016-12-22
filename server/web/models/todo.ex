defmodule Todos.Todo do
  use Todos.Web, :model

  schema "todos" do
    field :description, :string
    field :done, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :done])
    |> validate_required([:description, :done])
  end
end
