defmodule Todos.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :description, :string
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
