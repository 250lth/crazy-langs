defmodule HelloWeb.PageView do
  use HelloWeb, :view
  alias HelloWeb.AuthorView

  def message do
    "Hello from the view!"
  end

  def render("page_with_authors.json", %{page: page}) do
    %{title: page.title,
      authors: render_many(page.authors, AuthorView, "author.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end

end
