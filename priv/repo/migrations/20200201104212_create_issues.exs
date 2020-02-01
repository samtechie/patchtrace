defmodule Patchtrace.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues) do
      add :subject, :string
      add :description, :text

      timestamps()
    end

  end
end
