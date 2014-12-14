class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token
  after_filter :send_order_confirmation, only: [:callback]

  def callback
    if @order = Order.includes(:shipping_address).find_by(secret_id: params[:checkout][:pos_data])
      @order.status = params[:checkout][:status]
      @order.save!
      render json: {}, :status => 200
    else
      raise 'could not find order'
    end
  end

  private

  def send_order_confirmation
    return unless @order
    BitcrapMailer.order_confirmation(@order).deliver
  end
end