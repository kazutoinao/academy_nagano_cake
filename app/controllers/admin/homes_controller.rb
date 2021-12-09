class Admin::HomesController < ApplicationController
  def top
    @cart_items = CartItem.all
  end
end