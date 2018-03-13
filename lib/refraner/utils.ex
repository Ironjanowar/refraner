defmodule Refraner.Utils do
  def id_to_integer(id) when is_integer(id), do: id
  def id_to_integer(id) when is_binary(id), do: String.to_integer(id)
end
