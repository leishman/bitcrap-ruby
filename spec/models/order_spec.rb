require 'rails_helper'

describe Order do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :status }

  it "should set the secret_id and ref_id" do
    order = FactoryGirl.create(:order)
    expect(order.secret_id.length).to eq 18
    expect(order.ref_id.length).to eq 9
  end
end