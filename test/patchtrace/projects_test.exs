defmodule Patchtrace.ProjectsTest do
  use Patchtrace.DataCase

  alias Patchtrace.Projects

  describe "issues" do
    alias Patchtrace.Projects.Issue

    @valid_attrs %{description: "some description", subject: "some subject"}
    @update_attrs %{description: "some updated description", subject: "some updated subject"}
    @invalid_attrs %{description: nil, subject: nil}

    def issue_fixture(attrs \\ %{}) do
      {:ok, issue} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_issue()

      issue
    end

    test "list_issues/0 returns all issues" do
      issue = issue_fixture()
      assert Projects.list_issues() == [issue]
    end

    test "get_issue!/1 returns the issue with given id" do
      issue = issue_fixture()
      assert Projects.get_issue!(issue.id) == issue
    end

    test "create_issue/1 with valid data creates a issue" do
      assert {:ok, %Issue{} = issue} = Projects.create_issue(@valid_attrs)
      assert issue.description == "some description"
      assert issue.subject == "some subject"
    end

    test "create_issue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_issue(@invalid_attrs)
    end

    test "update_issue/2 with valid data updates the issue" do
      issue = issue_fixture()
      assert {:ok, %Issue{} = issue} = Projects.update_issue(issue, @update_attrs)
      assert issue.description == "some updated description"
      assert issue.subject == "some updated subject"
    end

    test "update_issue/2 with invalid data returns error changeset" do
      issue = issue_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_issue(issue, @invalid_attrs)
      assert issue == Projects.get_issue!(issue.id)
    end

    test "delete_issue/1 deletes the issue" do
      issue = issue_fixture()
      assert {:ok, %Issue{}} = Projects.delete_issue(issue)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_issue!(issue.id) end
    end

    test "change_issue/1 returns a issue changeset" do
      issue = issue_fixture()
      assert %Ecto.Changeset{} = Projects.change_issue(issue)
    end
  end

  describe "categories" do
    alias Patchtrace.Projects.Category

    @valid_attrs %{nname: "some nname"}
    @update_attrs %{nname: "some updated nname"}
    @invalid_attrs %{nname: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Projects.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Projects.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Projects.create_category(@valid_attrs)
      assert category.nname == "some nname"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Projects.update_category(category, @update_attrs)
      assert category.nname == "some updated nname"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_category(category, @invalid_attrs)
      assert category == Projects.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Projects.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Projects.change_category(category)
    end
  end
end
