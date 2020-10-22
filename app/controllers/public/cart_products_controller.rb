class Public::CartProductsController < ApplicationController
  def index
  end

  def create
    @cart_product = CartProduct.new(cart_params)
    if @cart_product.save
      flash[:notice] = "カートに商品を追加しました"
      redirect_to cart_products_path
    else
      flash[:notice] = "カートに商品を追加できませんでした"
      redirect_to product_path(params[:id])
    end
  end

  def destroy_all
  end

  def destroy
  end

  def update
  end

  private

  def cart_params
    params.permit(:product_id, :customer_id, :quantity)
    #.require(:cart_product)
  end

end
