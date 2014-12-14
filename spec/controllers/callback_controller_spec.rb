require 'rails_helper'

describe CallbackController do
  it "should return success if an order is found" do
    order = FactoryGirl.create(:shipping_address).order
    params = {"checkout"=>{"uid"=>"MAI_465b3efdba698640be908d0b1aa85cf6fe22c96e0af5", "created_at"=>"2014-12-03 18:14:12 UTC", "status"=>"paid", "currency_amount"=>"5.0", "currency_type"=>"usd", "merchant_ref_id"=>order.ref_id, "pos_data"=>order.secret_id}}
    post :callback, params
    expect(response).to be_success
  end

  it "should update the status of an order" do
    order = FactoryGirl.create(:shipping_address).order
    expect do
      params = {"checkout"=>{"uid"=>"MAI_465b3efdba698640be908d0b1aa85cf6fe22c96e0af5", "created_at"=>"2014-12-03 18:14:12 UTC", "status"=>"paid", "currency_amount"=>"5.0", "currency_type"=>"usd", "merchant_ref_id"=>order.ref_id, "pos_data"=>order.secret_id}}
      post :callback, params
    end.to change { order.reload.status }.from('unpaid').to('paid')
  end

  it "should raise an error if it cannot find the order" do
    order = FactoryGirl.create(:shipping_address).order
    params = {"checkout"=>{"uid"=>"MAI_465b3efdba698640be908d0b1aa85cf6fe22c96e0af5", "created_at"=>"2014-12-03 18:14:12 UTC", "status"=>"paid", "currency_amount"=>"5.0", "currency_type"=>"usd", "merchant_ref_id"=>order.ref_id, "pos_data"=>'random'}}
    expect do
      post :callback, params
    end.to raise_error
  end
end