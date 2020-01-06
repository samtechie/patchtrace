defmodule PatchtraceWeb.PageController do
  use PatchtraceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
