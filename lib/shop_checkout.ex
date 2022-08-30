defmodule ShopCheckout do
  @moduledoc """
  Documentation for `ShopCheckout`.
  """

  @doc """
  Empty Cart

  ## Examples

      iex> ShopCheckout.checkout([])
      0.0

  """
  def checkout(cart_list) do
    Enum.reduce(cart_list, %{gr1: 0, sr1: 0, cf1: 0}, &beep/2)
    |> count_total()
  end

  # -----------------------------------------------

  def count_total(%{gr1: gr1, sr1: sr1, cf1: cf1}) do
    total_gr(gr1) + total_sr(sr1) + total_cf(cf1)
  end

  def beep(itemId, acc) when itemId == :gr1 or itemId == :sr1 or itemId == :cf1 do
      Map.update!(acc, itemId, &(&1 + 1))
  end
  def beep(_itemId, acc) do
      acc
  end

  # -----------------------------------------------

  def total_gr(gr1) do
    (rem(gr1, 2)  + div(gr1, 2)) * 3.11
    |> Float.round(2)
  end

  def total_sr(sr1) when sr1 >= 3 do
    sr1 * 4.5
    |> Float.round(2)
  end
  def total_sr(sr1) do
    sr1 * 5.0
    |> Float.round(2)
  end

  def total_cf(cf1) when cf1 >= 3 do
    cf1 * (11.23 * 2 / 3 )
    |> Float.round(2)
  end;
  def total_cf(cf1) do
    cf1 * 11.23
    |> Float.round(2)
  end;


end
