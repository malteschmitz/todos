defmodule Todos.Router do
  use Todos.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Todos do
    pipe_through :api

    resources "/todos", TodoController, except: [:new, :edit]
  end
end
