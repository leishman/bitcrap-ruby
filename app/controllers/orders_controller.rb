class OrdersController < ApplicationController
  respond_to :json

  def index
    respond_with Order.all
  end

  def show
    respond_with Order.find_by(uid:params[:uid])
  end

  def create
    respond_with Order.create(params[:order])
  end
end
