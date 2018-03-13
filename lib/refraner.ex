defmodule Refraner do
  import Refraner.Utils, only: [id_to_integer: 1]
  import Ecto.Query, only: [from: 2]

  def get_random_refran() do
    q = from(refran in Refraner.Model.Refran, order_by: [asc: fragment("RANDOM()")], limit: 1)
    Refraner.Repo.one(q)
  end

  def get_refran_by_id(id) do
    id = id_to_integer(id)
    Refraner.Model.Refraner |> Refraner.Repo.get(id)
  end

  def add_rating(_refran_id, _rate) do
    # TODO
  end
end
