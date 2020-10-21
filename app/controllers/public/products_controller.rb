class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    # @products = Product.all.page(params[:page]).per(8)
    @products = Product.where(is_active: "Availble").page(params[:page]).per(8)
  end

  def genre
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
  end

  def top
    @products = Product.all.order(created_at: :asc)
    #=> :asc,古い順 :desc,新しい順
    @genres = Genre.all
  end

  def about
  end
end
