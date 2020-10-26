class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
      @order_products = @order.ordered_products
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.order_received_status == 'payed'
        @order.ordered_products.update_all(production_status: "waiting")
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_received_status)
  end
end
