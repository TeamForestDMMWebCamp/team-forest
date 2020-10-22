class Public::CartProductsController < ApplicationController
  #before_action :authenticate_customer!
  #before_action :correct_customer, only: [:index, :create, :update, :destory]
  
  def index
    @cart_products = current_customer.cart_products
  end

  def create
    @cart_product = current_customer.cart_products.new(cart_product_params)

    # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
    @update_cart_product =  CartProduct.find_by(product: @cart_product.product)
    if @update_cart_product.present? && @cart_product.Availble?
        @cart_product.quantity += @update_cart_product.quantity
        @update_cart_product.destroy
    end

    if @cart_product.save
      flash[:notice] = "#{@cart_product.product.name}をカートに追加しました"
      redirect_to products_path
    else
      @product = Product.find(params[:cart_product][:product_id])
      @cart_product = CartProduct.new
      flash[:alert] = "個数を選択してください"
      render ("customer/products/show")
    end
  
  end


  def destroy_all
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to request.referer
  end

  def destroy
    @cart_product.destroy
    flash.now[:alert] = "#{@cart_product.product.name}を削除しました"
    @cart_products = current_cart
    @total = total_payment(@cart_products).to_s(:delimited)
  end

  def update
    @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
    flash.now[:success] = "#{@cart_product.product.name}の数量を変更しました"
    @price = price_including_tax(@cart_product).to_s(:delimited)
    @cart_products = current_cart
    @total = total_payment(@cart_products).to_s(:delimited)
  end
  
  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :product_id)
  end
  
  def correct_customer
    customer = Customer.find(params[:customer_id])
    unless current_customer = customer
      redirect_to root_path
    end
  end
  
end
