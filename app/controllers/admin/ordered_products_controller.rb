class Admin::OrderedProductsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @ordered_product = OrderedProduct.find(params[:id])
    if @ordered_product.update(ordered_product_params)
      if @ordered_product.production_status == "making"
        @ordered_product.order.update(order_received_status: "making")
      end
      if @ordered_product.order.ordered_products.pluck(:production_status).all?{|procomplete| procomplete == "compleate"}
        @ordered_product.order.update(order_received_status: "preparing")
      end
    end
  end

  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end


end
