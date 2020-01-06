defmodule Patchtrace.Repo do
  use Ecto.Repo,
    otp_app: :patchtrace,
    adapter: Ecto.Adapters.Postgres
end
