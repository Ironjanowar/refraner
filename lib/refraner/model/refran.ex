defmodule Refraner.Model.Refran do
  use Ecto.Schema

  schema "refranes" do
    field(:refran, :string)
    field(:significado, :string)
    field(:rate, :integer)
    field(:ideas_clave, :string)
    field(:marcador_de_uso, :string)
    field(:tipo, :string)
  end
end
