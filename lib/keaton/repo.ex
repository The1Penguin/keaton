defmodule Keaton.Repo do
  use Ecto.Repo,
    otp_app: :keaton,
    adapter: Ecto.Adapters.Postgres
end
