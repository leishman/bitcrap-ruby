class OrdersController < ApplicationController

  def show
    @order = Order.find_by(ref_id: params[:ref_id])
  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
      builder = build_request
      if @checkout = ::MaicoinClient.create_checkout(builder.build).checkout
        @address = @order.shipping_address
      else
        @errors = ['Checkout Failed. Please Try later']
        render :create, status: 406
      end
    else
      @errors = @order.errors.full_messages
      render :create, status: 406
    end
  end

  def cancel
  end

  private

  def order_params
    params.require(:order).permit(:amount, :name, :email, shipping_address_attributes: [:address_line_1, :address_line_2, :address_line_3, :city, :state, :zip_code])
  end

  def build_request
    param_builder = MaiCoin::CheckoutParamBuilder.new
    amount = @order.amount
    currency = @order.currency
    # TODO remove hard coding of URLs
    return_url = "https://bitcrap.com/orders/#{@order.ref_id}"
    cancel_url = "https://bitcrap.com/cancel"
    callback_url = url_for(controller: :callback, action: :callback)
    opts = {
      "merchant_ref_id" => @order.ref_id,
      "pos_data" => @order.secret_id,
      "locale" => "en"
    }
    param_builder.set_checkout_data(amount, currency, return_url, cancel_url, callback_url, opts)
    buyer_opts = { address1: @order.shipping_address.address_line_1 }
    param_builder.set_buyer_data(buyer_opts)
    param_builder
  end
end
