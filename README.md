# Virgil

A delightful way to share, discuss, and annotate poetry

## Installing pre-requisites

You will need the following:

* Erlang
* Elixir
* PostgreSQL
* Phoenix

### Quick installation for Mac OS

Homebrew works really well.  (If you want finer control, consider [asdf](https://github.com/asdf-vm/asdf/blob/master/ballad-of-asdf.md)!)

```sh
> brew install erlang
> brew install elixir
> brew install postgresql
> mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
```

### More on PostgreSQL

You may need to define a 'postgres' user:

```sh
> createuser -d postgres
```

You can use homebrew to run PostgreSQL in the background:

* `brew services list` -- see if PostgreSQL is up or down
* `brew services start postgresql` -- start PostgreSQL

## Running a development server

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Running automated tests

```sh
> mix test
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
