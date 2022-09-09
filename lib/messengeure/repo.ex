defmodule Messengeure.Repo do
  use Ecto.Repo,
    otp_app: :messengeure,
    adapter: Ecto.Adapters.Postgres
end
