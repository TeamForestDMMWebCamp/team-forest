class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def information
    @shipping_addresses = current_customer.shipping_addresses
  end

  def confirm
    @cart_products = current_customer.cart_products
    @shipping_fee = 800
    if params["radio"] == "r1"
      # payment_methodのみ取得
      @order = Order.new(order_params)
      # 住所は会員情報から取得
      render :new
    elsif params["radio"] == "r2"
      # payment_methodのみ取得
      @order = Order.new(order_params)
      # 住所は配送先一覧から取得
      @shipping_address = ShippingAddress.find(params[:shipping_select])
      render :new
    elsif params["radio"] == "r3"
      # text_fieldからもデータ取得
      @order = Order.new(order_form_params)
      render :new
    else
      # エラーメッセージ
      render :information
    end
  end

  def new

  end

  def create
  end

  def thanks
  end

  private

  # 宛先選択のラジオボタンが１か２だった場合
  def order_params
    params.permit(:payment_method)
  end

  # 宛先選択のラジオボタンが３だった場合
  def order_form_params
    params.permit(:payment_method, :shipping_name, :shipping_address, :shipping_postal_code)
  end

end
