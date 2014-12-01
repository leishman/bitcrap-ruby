require 'rails_helper'

describe OrdersController do
  it "should create an order" do
    expect do
      post :create, "order"=>{"amount"=>"10", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"asdf", "city"=>"adsf", "state"=>"AL", "zip_code"=>"asdf"}}
    end.to change { Order.count }.by 1

    expect do
      post :create, "order"=>{"amount"=>"10", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"asdf", "city"=>"adsf", "state"=>"AL", "zip_code"=>"asdf"}}
    end.to change { ShippingAddress.count }.by 1

  end
end