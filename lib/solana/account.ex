defmodule Solana.Account do
  @moduledoc """
  Functions, types, and structures related to Solana
  [accounts](https://docs.solana.com/developing/programming-model/accounts).
  """
  @derive Jason.Encoder

  @typedoc """
  All the information needed to encode an account in a transaction message.
  """
  @type t :: %__MODULE__{
          signer?: boolean(),
          writable?: boolean(),
          key: Solana.key() | nil
        }

  defstruct [
    :key,
    signer?: false,
    writable?: false
  ]
end

defimpl Jason.Encoder, for: Solana.Account do
  def encode(account = %Solana.Account{}, _opts) do
    Jason.encode!(%{
      key: Base58.encode(account.key),
      signer?: account.signer?,
      writable?: account.writable?
    })
  end
end
