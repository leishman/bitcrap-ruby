class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(uid:params[:uid])
  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
      builder = build_request
      @checkout = ::MaicoinClient.create_checkout(builder.build)
    else
      @errors = @order.errors.messages
      render :create, status: 406
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount, shipping_address_attributes: [:address_line_1, :address_line_2, :address_line_3, :city, :state, :zip_code])
  end

  def build_request
    param_builder = MaiCoin::CheckoutParamBuilder.new
    amount = @order.amount
    currency = @order.currency
    return_url = 'https://bitcrap.com/return'
    cancel_url = 'https://bitcrap.com/cancel'
    callback_url = 'https://bitcrap.com/maicoin/callback'
    opts = {
      "merchant_ref_id" => "order_id_#{@order.id}",
      "locale" => "en"
    }
    param_builder.set_checkout_data(amount, currency, return_url, cancel_url, callback_url, opts)
    buyer_opts = { address1: @order.shipping_address.address_line_1 }
    param_builder.set_buyer_data(buyer_opts)
    param_builder
  end
end
