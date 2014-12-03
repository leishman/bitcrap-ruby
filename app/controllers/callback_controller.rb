class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def callback
    if order = Order.find_by(secret_id: params[:checkout][:pos_data])
      order.status = params[:checkout][:status]
      order.save!
      render json: {}, :status => 200
    else
      raise 'could not find order'
    end
  end
end