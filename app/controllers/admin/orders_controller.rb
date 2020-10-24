class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order_products = Order_products.all
  end

  def update
  end
end
