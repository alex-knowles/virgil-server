# Script for de-populating the database. You can run it as:
#
#     mix run priv/repo/weeds.exs

alias Virgil.Repo
alias Virgil.Poem

{num_deleted, _} = Repo.delete_all(Poem)
IO.puts "Deleted #{num_deleted} poems!"
