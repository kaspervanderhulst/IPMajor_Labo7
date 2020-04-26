defmodule VanderhulstKasperIpmProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      VanderhulstKasperIpmProject.Repo
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: VanderhulstKasperIpmProject.Supervisor)
  end
end
