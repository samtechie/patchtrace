defmodule Patchtrace.Projects.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issues" do
    field :description, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:subject, :description])
    |> validate_required([:subject, :description])
  end
end
