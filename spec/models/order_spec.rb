require 'rails_helper'

describe Order do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  it "should set the uid" do
    order = FactoryGirl.create(:order)
    expect(order.uid.length).to eq 32
  end
end