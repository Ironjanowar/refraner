defmodule Refraner do
  import Refraner.Utils
  import Ecto.Query, only: [from: 2]

  def get_random_refran() do
    q = from(refran in Refraner.Model.Refran, order_by: [asc: fragment("RANDOM()")], limit: 1)
    Refraner.Repo.one(q)
  end

  def get_refran_by_id(id) do
    id = id_to_integer(id)
    Refraner.Model.Refran |> Refraner.Repo.get(id)
  end

  def add_rating(refran_id, new_rate) do
    %{rate: rate, total_votos: total_votos} = refran = get_refran_by_id(refran_id)
    {new_rate, new_total_votos} = calculate_new_rate(rate, total_votos, new_rate)

    Refraner.Model.Refran.update_rate(refran, %{rate: new_rate, total_votos: new_total_votos})
    |> Refraner.Repo.update()
  end
end
