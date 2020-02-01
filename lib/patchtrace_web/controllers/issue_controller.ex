defmodule PatchtraceWeb.IssueController do
  use PatchtraceWeb, :controller

  alias Patchtrace.Projects
  alias Patchtrace.Projects.Issue

  def index(conn, _params) do
    issues = Projects.list_issues()
    render(conn, "index.html", issues: issues)
  end

  def new(conn, _params) do
    changeset = Projects.change_issue(%Issue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"issue" => issue_params}) do
    case Projects.create_issue(issue_params) do
      {:ok, issue} ->
        conn
        |> put_flash(:info, "Issue created successfully.")
        |> redirect(to: Routes.issue_path(conn, :show, issue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    issue = Projects.get_issue!(id)
    render(conn, "show.html", issue: issue)
  end

  def edit(conn, %{"id" => id}) do
    issue = Projects.get_issue!(id)
    changeset = Projects.change_issue(issue)
    render(conn, "edit.html", issue: issue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "issue" => issue_params}) do
    issue = Projects.get_issue!(id)

    case Projects.update_issue(issue, issue_params) do
      {:ok, issue} ->
        conn
        |> put_flash(:info, "Issue updated successfully.")
        |> redirect(to: Routes.issue_path(conn, :show, issue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", issue: issue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    issue = Projects.get_issue!(id)
    {:ok, _issue} = Projects.delete_issue(issue)

    conn
    |> put_flash(:info, "Issue deleted successfully.")
    |> redirect(to: Routes.issue_path(conn, :index))
  end
end
