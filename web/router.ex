defmodule Virgil.Router do
  use Virgil.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Virgil do
    pipe_through :api

    resources "/poems", PoemController, except: [:new, :edit]
  end
end
