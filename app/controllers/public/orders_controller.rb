class Public::OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
    @orderd_products = OrderedProduct.where(order_id: params[:id])
  end

  def information
  end

  def new
  end

  def confirm
  end

  def create
  end

  def thanks
  end
end
