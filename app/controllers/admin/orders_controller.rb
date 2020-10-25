class Admin::OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @orderd_product = OrderProduct.find(params[:production_status])
    @order = Order.find(params[:id])
   if @order.update(payed)
      @ordered_product.update
     redirect_back(fallback_location: admin_order_path)
     flash[notice] = '更新に成功しました'
   else
     render :show
   end
  end
  
  private 
 def order_params
   params.require(:order).permit(:order_received_status)
 end
end
