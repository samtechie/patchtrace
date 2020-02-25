defmodule PatchtraceWeb.Router do
  use PatchtraceWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PatchtraceWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/issues", IssueController
    resources "/categories", CategoryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PatchtraceWeb do
  #   pipe_through :api
  # end
end
