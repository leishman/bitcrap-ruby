class CallbackController < ApplicationController
  def callback
    order = Order.find_by(uid: params[:checkout][:merchant_ref_id])
    order.status = params[:checkout][:status]
    order.save!
  end
end