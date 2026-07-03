defmodule KeatonWeb.HelloController do
  use KeatonWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
