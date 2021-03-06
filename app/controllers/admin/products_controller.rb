class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @products = Product.all
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[notice] = "商品登録しました"
      redirect_to admin_product_path(@product)
    else
      flash[notice] = "商品登録ができませんでした"
      render :new
      
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[notice] = '編集に成功しました'
      redirect_to admin_product_path(@product)
    else
      flash[notice] = "編集ができませんでした"
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:is_active, :name, :discription, :price_excluding_tax, :genre_id, :image)
  end

end
