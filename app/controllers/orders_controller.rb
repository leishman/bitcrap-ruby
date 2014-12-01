class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(uid:params[:uid])
  end

  def create
    @order = Order.create(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:amount, shipping_address_attributes: [:address_line_1, :address_line_2, :address_line_3, :city, :state, :zip_code, presence: true])
  end
end
