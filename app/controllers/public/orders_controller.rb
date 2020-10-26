class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

	def index
   	 @orders = current_customer.orders
	end

  def show
    @order = Order.find(params[:id])
    @ordered_products = OrderedProduct.where(order_id: params[:id])
  end

  def information
    @shipping_addresses = current_customer.shipping_addresses
  end

  def confirm
    # ユーザーのカート内商品の取得
    @cart_products = current_customer.cart_products
    # ↓送料の指定
    @shipping_fee = 800

    # ↓お届け先の条件分岐
    if params["radio"] == "r1"
      # payment_methodのみ取得
      @order_info = Order.new(order_select_params)
      # 住所は会員情報から取得
      render :new

    elsif params["radio"] == "r2"
      # payment_methodのみ取得
      @order_info = Order.new(order_select_params)
      # 住所は配送先一覧から取得
      @shipping_address = ShippingAddress.find(params[:shipping_select])
      render :new

    elsif params["radio"] == "r3"
      # text_fieldからもデータ取得
      @order_info = Order.new(order_form_params)
      render :new
    else
      #ラジオボタン自動選択なので、基本的には発生しない
      flash[:notice] = "配送先が選択されていません"
      render :information
    end
  end

  def new

  end

  def create
    @order = Order.new(order_params)
    @cart_products = current_customer.cart_products

    if @order.save
      @cart_products.each do |cart|
        @ordered_product =  OrderedProduct.new
        @ordered_product.order_id = @order.id
        @ordered_product.product_id = cart.product.id
				@ordered_product.ordered_quantity = cart.quantity
				@ordered_product.price_including_tax = cart.product.including_tax

				@ordered_product.save
			end

			@cart_products.destroy_all
      redirect_to orders_thanks_path
    else
      flash[:notice] = "情報の入力を完了してください"
      redirect_to orders_information_path
    end
  end

  def thanks
  end

  private

  # 宛先選択のラジオボタンが１(現在住所)か２(配送先一覧から選択)だった場合
  def order_select_params
    params.permit(:payment_method)
  end

  # 宛先選択のラジオボタンが３(新規入力)だった場合
  def order_form_params
    params.permit(:payment_method, :shipping_name, :shipping_postal_code, :shipping_address)
  end

  def order_params
    params.permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :shipping_fee, :total_payment, :payment_method)
  end

end
