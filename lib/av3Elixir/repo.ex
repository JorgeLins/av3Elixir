defmodule Av3Elixir.Repo do
  use Ecto.Repo,
    otp_app: :av3Elixir,
    adapter: Ecto.Adapters.Postgres
end
