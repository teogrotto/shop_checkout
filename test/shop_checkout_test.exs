defmodule ShopCheckoutTest do
  use ExUnit.Case
  doctest ShopCheckout

  test "basket1" do
    assert ShopCheckout.checkout([:gr1, :sr1, :gr1, :gr1, :cf1]) == 22.45
  end

  test "basket2" do
    assert ShopCheckout.checkout([:gr1, :gr1]) == 3.11
  end

  test "basket3" do
    assert ShopCheckout.checkout([:sr1,:sr1,:gr1,:sr1]) == 16.61
  end

  test "basket4" do
    assert ShopCheckout.checkout([:gr1,:cf1,:sr1,:cf1,:cf1]) == 30.57
  end

  test "wrong items in the basket" do
    assert ShopCheckout.checkout([:gr1,:cf1,:sr1,:cf1,:cf1, :unknown]) == 30.57
  end

  test "green_tea" do
    assert ShopCheckout.total_gr(0) == 0
    assert ShopCheckout.total_gr(1) == 3.11
    assert ShopCheckout.total_gr(2) == 3.11
    assert ShopCheckout.total_gr(3) == 6.22
    assert ShopCheckout.total_gr(4) == 6.22
    assert ShopCheckout.total_gr(5) == 9.33
  end

  test "strawberries" do
    assert ShopCheckout.total_sr(0) == 0
    assert ShopCheckout.total_sr(1) == 5
    assert ShopCheckout.total_sr(2) == 10
    assert ShopCheckout.total_sr(3) == 13.50
    assert ShopCheckout.total_sr(4) == 18
    assert ShopCheckout.total_sr(5) == 22.50
  end

  test "coffe" do
    assert ShopCheckout.total_cf(0) == 0
    assert ShopCheckout.total_cf(1) == 11.23
    assert ShopCheckout.total_cf(2) == 22.46
    assert ShopCheckout.total_cf(3) == 22.46
    assert ShopCheckout.total_cf(4) == 29.95
    assert ShopCheckout.total_cf(5) == 37.43
  end

end
