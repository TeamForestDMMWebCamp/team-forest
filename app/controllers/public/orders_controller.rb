class Public::OrdersController < ApplicationController
	def index
   	 @orders = current_customer.orders
	end 

  def show
  end

  def information
  end

  def new
  end

  def confirm
  end

  def create
  end

  def thanks
  end
end
