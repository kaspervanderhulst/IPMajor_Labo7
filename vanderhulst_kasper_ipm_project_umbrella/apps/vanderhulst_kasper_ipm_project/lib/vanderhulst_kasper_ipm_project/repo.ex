defmodule VanderhulstKasperIpmProject.Repo do
  use Ecto.Repo,
    otp_app: :vanderhulst_kasper_ipm_project,
    adapter: Ecto.Adapters.MyXQL
end
