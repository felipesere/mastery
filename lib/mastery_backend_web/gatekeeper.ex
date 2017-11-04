defmodule MasteryBackendWeb.Gatekeeper do
  def protect(conn, user_id) do
    encrypted = MasteryBackend.Secure.encrypt(user_id)

    conn
    |> Plug.Conn.put_resp_cookie("auth", encrypted)
  end

  def verify(conn) do
    conn
    |> Plug.Conn.fetch_cookies()
    |> auth()
    |> decrypt()
  end

  def auth(conn), do: conn.cookies["auth"]

  defp decrypt(nil), do: :no_cookie
  defp decrypt(value) do
    MasteryBackend.Secure.decrypt(value)
  end
end
