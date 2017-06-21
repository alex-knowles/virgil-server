# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

alias Virgil.Repo
alias Virgil.Poem

Repo.insert!(%Poem{
  title: "The God Who Only Knows Four Words",
  author: "Hafez",
  collection: "",
  text: """
  Every Child
  Has known God,
  Not the God of names,
  Not the God of Don'ts
  Not the God who ever does anything weird
  But the God who only knows four words
  And keeps repeating them, saying:
  "Come dance with Me"
  Come Dance
  """
})

Repo.insert!(%Poem{
  title: "The Modern Magus",
  author: "Bobby Arnold",
  collection: "Where the Sidewalk Starts",
  text: """
  This is
  NOT
  a         poem.
  """
})

Repo.insert!(%Poem{
  title: "Treehouse Passwords, Verse 2",
  author: "Bill Watterson",
  collection: "The Essential Calvin and Hobbes",
  text: """
  Tigers are great
  They can't be beat
  If I was a tiger
  That would be neat!
  """,
})
