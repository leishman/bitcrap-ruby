class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def callback
    if order = Order.find_by(secret_id: params[:checkout][:merchant_ref_id])
      order.status = params[:checkout][:status]
      order.save!
    else
      raise 'could not find order'
    end
  end
end