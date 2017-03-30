defmodule GoogleLogin do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    children = [
      # Define workers and child supervisors to be supervised
      Plug.Adapters.Cowboy.child_spec(:http, GoogleLogin.UI, [], [port: 4001])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule GoogleLogin.UI do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    %Plug.Conn{path_info: path_parts} = conn
    case path_parts do
      [] ->
        html = EEx.eval_file("priv/app.eex")
        send_resp(conn, 200, html)
      ["validate-token"] ->
        {:ok, post_data, conn} = read_body(conn)
        case Jwt.verify(post_data) do
          {:ok, _claims} ->
            send_resp(conn, 200, ~s({"validated": true}))
          _ ->
            send_resp(conn, 200, ~s({"validated": false}))
        end
    end
  end
end
