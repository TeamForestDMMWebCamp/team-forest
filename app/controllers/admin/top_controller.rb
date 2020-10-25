class Admin::TopController < ApplicationController
  def top
    @today = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
  end
end
