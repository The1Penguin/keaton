defmodule KeatonWeb.PageController do
  use KeatonWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
