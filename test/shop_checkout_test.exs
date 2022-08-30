defmodule ShopCheckoutTest do
  use ExUnit.Case
  doctest ShopCheckout

  test "test1" do
    assert ShopCheckout.checkout([:gr1, :sr1, :gr1, :gr1, :cf1]) == 22.45
  end

  test "test2" do
    assert ShopCheckout.checkout([:gr1, :gr1]) == 3.11
  end

  test "test3" do
    assert ShopCheckout.checkout([:sr1,:sr1,:sr1,:gr1]) == 16.61
  end

  test "test4" do
    assert ShopCheckout.checkout([:gr1,:cf1,:gr1,:cf1,:cf1]) == 30.57
  end
end
