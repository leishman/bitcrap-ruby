require 'rails_helper'

describe OrdersController do
  before do
    MaicoinClient.stub(:create_checkout).and_return(Hashie::Mash.new({checkout: true}))
  end
  it "should create an order and a shipping address" do
    expect do
      post :create, "order"=>{"amount"=>"10", "email"=>"leishman@maicoin.com", "name"=>"Bobby Tables", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"line 2", "city"=>"adsf", "state"=>"AL", "zip_code"=>"12345"}}, format: :js
    end.to change { Order.count }.by 1

    expect do
      post :create, "order"=>{"amount"=>"10", "email"=>"leishman@maicoin.com", "name"=>"Bobby Tables", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"line 2", "city"=>"adsf", "state"=>"AL", "zip_code"=>"12345"}}, format: :js
    end.to change { ShippingAddress.count }.by 1
  end

  it "should not create an order or shipping address if anything is invalid" do
    expect do
      post :create, "order"=>{"amount"=>"10", "email"=>"leishman@maicoin.com", "name"=>"Bobby Tables", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"line 2", "city"=>"adsf", "state"=>nil, "zip_code"=>nil}}, format: :js
    end.to_not change { Order.count }

    expect do
      post :create, "order"=>{"amount"=>"10", "email"=>"leishman@maicoin.com", "name"=>"Bobby Tables", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"line 2", "city"=>"adsf", "state"=>nil, "zip_code"=>nil}}, format: :js
    end.to_not change { ShippingAddress.count }

    expect do
      post :create, "order"=>{"amount"=>nil, "email"=>"leishman@maicoin.com", "name"=>"Bobby Tables", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"line 2", "city"=>"adsf", "state"=>"AL", "zip_code"=>"12345"}}, format: :js
    end.to_not change { ShippingAddress.count }

    expect do
      post :create, "order"=>{"amount"=>nil, "email"=>"leishman@maicoin.com", "name"=>"Bobby Tables", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"line 2", "city"=>"adsf", "state"=>"AL", "zip_code"=>"12345"}}, format: :js
    end.to_not change { Order.count }
  end

  it "should return errors when invalid" do
    post :create, "order"=>{"amount"=>nil, "email"=>"leishman@maicoin.com", "name"=>"Bobby Tables", "shipping_address_attributes"=>{"address_line_1"=>"23123 ", "address_line_2"=>"line 2", "city"=>"adsf", "state"=>"AL", "zip_code"=>"12345"}}, format: :js
    expect(response.status).to eq 406
  end
end