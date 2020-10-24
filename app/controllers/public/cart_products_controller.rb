class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!
  #before_action :correct_customer, only: [:index, :create, :update, :destory]

  def index
    @cart_products = current_customer.cart_products
  end

  def create
    @cart_product = CartProduct.new(cart_params)

    # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
    @update_cart_product =  CartProduct.find_by(product: @cart_product.product)
    if @update_cart_product.present? && @cart_product.present?
        @cart_product.quantity += @update_cart_product.quantity
        @update_cart_product.destroy
    end

    if @cart_product.save
      flash[:notice] = "カートに商品を追加しました"
      redirect_to cart_products_path
    else
      flash[:notice] = "カートに商品を追加できませんでした"
      redirect_to product_path(params[:id])
    end
  end


  def destroy_all
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to request.referer
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash.now[:alert] = "#{@cart_product.product.name}を削除しました"
    redirect_to request.referer
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
    flash.now[:success] = "#{@cart_product.product.name}の数量を変更しました"
    redirect_to cart_products_path
  end

  private


  def correct_customer
    customer = Customer.find(params[:customer_id])
    unless current_customer = customer
      redirect_to root_path
    end
  end

  def cart_params
    params.permit(:product_id, :customer_id, :quantity)
    #.require(:cart_product)
  end

end
