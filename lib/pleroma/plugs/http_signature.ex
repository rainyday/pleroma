defmodule Pleroma.Web.Plugs.HTTPSignaturePlug do
  alias Pleroma.Web.HTTPSignatures
  import Plug.Conn
  require Logger

  def init(options) do
    options
  end

  def call(%{assigns: %{valid_signature: true}} = conn, opts) do
    conn
  end

  def call(conn, opts) do
    user = conn.params["actor"]
    Logger.debug("Checking sig for #{user}")
    [signature | _] = get_req_header(conn, "signature")

    cond do
      signature && String.contains?(signature, user) ->
        conn =
          conn
          |> put_req_header(
            "(request-target)",
            String.downcase("#{conn.method}") <> " #{conn.request_path}"
          )

        assign(conn, :valid_signature, HTTPSignatures.validate_conn(conn))

      signature ->
        Logger.debug("Signature not from actor")
        assign(conn, :valid_signature, false)

      true ->
        Logger.debug("No signature header!")
        conn
    end
  end
end
