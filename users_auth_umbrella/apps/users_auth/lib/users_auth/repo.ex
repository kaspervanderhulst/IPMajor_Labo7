defmodule UsersAuth.Repo do
  use Ecto.Repo,
    otp_app: :users_auth,
    adapter: Ecto.Adapters.MyXQL
end
