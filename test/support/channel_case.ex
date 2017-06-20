defmodule Virgil.ChannelCase do
  @moduledoc """
  This module defines the test case to be used by
  channel tests.

  Such tests rely on `Phoenix.ChannelTest` and also
  import other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      use Phoenix.ChannelTest

      alias Virgil.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query


      # The default endpoint for testing
      @endpoint Virgil.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Virgil.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Virgil.Repo, {:shared, self()})
    end

    :ok
  end
end
