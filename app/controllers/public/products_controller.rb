class Public::ProductsController < ApplicationController
  def index
  end

  def genre
  end

  def show
  end

  def top
    @products = Product.all.order(created_at: :asc)
    #=> :asc,古い順 :desc,新しい順
    #@genres = Genre.all
  end

  def about
  end
end
