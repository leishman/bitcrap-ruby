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
      opts = {
        amount: @order.amount,
        currency: @order.currency, # Todo validate
        return_url: 'http://localhost:3000',
        cancel_url: 'http://localhost:3000',
        callback_url:'http://localhost:3000/callback',
        locale: 'en'
      }
      @checkout = {
        "success" => true,
        "code" => 0,
        "errors" => [],
        "checkout" => {
          "uid" => "MAI_c6aa9011dec314395bc1bfa0f6f077a582786aac8383",
          "created_at" => "2014-11-28T03:38:31.558Z",
          "status" => "unpaid",
          "amount" => "150.00",
          "currency" => "twd",
          "cancel_url" => "https://yourstore.com/cancel",
          "return_url" => "https://yourstore.com/return",
          "callback_url" => "https://yourstore.com/maicoin/callback",
          "locale" => "zh-TW",
          "checkout_url" => "https://www.maicoin.com/zh-TW/checkouts/MAI_c6aa9011dec314395bc1bfa0f6f077a582786aac8383",
          "merchant_ref_id" => "order_id_12345",
          "pos_data" => "customer_id=1345",
          "buyer" => {
            "buyer_name" => "Jesse James",
            "buyer_address1" => "Apt 123",
            "buyer_address2" => "Road Abc",
            "buyer_city" => "SF",
            "buyer_state" => "CA",
            "buyer_zip" => "94305",
            "buyer_country" => "US",
            "buyer_email" => "abc@gmail.com",
            "buyer_phone" => "6504349399"
          }
        }
      }
      #::MaicoinClient.create_checkout(opts)
    else
      @errors = @order.errors.messages
      render :create, status: 406
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount, shipping_address_attributes: [:address_line_1, :address_line_2, :address_line_3, :city, :state, :zip_code])
  end
end
