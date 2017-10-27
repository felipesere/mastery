defmodule MasteryBackend.Secure do
  alias Plug.Crypto.KeyGenerator
  alias Plug.Crypto.MessageEncryptor

  def start_link do
    config = Application.get_env(:mastery_backend, :secure)
    [base: base, cookie_salt: cookie_salt, sign_salt: sign_salt] = config

    secret = KeyGenerator.generate(base, cookie_salt)
    sign_secret = KeyGenerator.generate(base, sign_salt)

    Agent.start_link(fn() -> %{secret: secret, sign_secret: sign_secret } end, name: __MODULE__)
  end

  def encrypt(data) do
    [secret, sign_secret] = keys()

    MessageEncryptor.encrypt(data, secret, sign_secret)
  end

  def decrypt(data) do
    [secret, sign_secret] = keys()

    MessageEncryptor.decrypt(data, secret, sign_secret)
  end

  defp keys() do
    %{secret: secret, sign_secret: sign_secret} = Agent.get(__MODULE__, &(&1))
    [secret, sign_secret]
  end
end
