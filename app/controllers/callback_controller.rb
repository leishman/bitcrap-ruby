class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def callback
    order = Order.find_by(uid: params[:checkout][:merchant_ref_id])
    order.status = params[:checkout][:status]
    order.save!
  end
end