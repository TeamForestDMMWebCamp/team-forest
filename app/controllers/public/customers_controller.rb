class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def quit
  end

  def out
    @customer = current_customer
    @customer.is_deleted = :inactive
    @customer.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end
end
