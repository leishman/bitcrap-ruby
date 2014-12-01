class HomeController < ApplicationController

  def index
    @order = Order.new
    @order.build_shipping_address
  end
end
