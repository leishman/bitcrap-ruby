require 'rails_helper'

describe Order do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :status }
  it { should validate_numericality_of(:amount).is_greater_than(0).only_integer }
  it { should ensure_inclusion_of(:amount).in_array(Order::VALID_AMOUNTS) }

  it "should set the secret_id and ref_id" do
    order = FactoryGirl.create(:order)
    expect(order.secret_id.length).to eq 22
    expect(order.ref_id.length).to eq 18
  end

  it "should show shipping status" do
    order = FactoryGirl.create(:order)
    expect(order.shipping_status).to eq 'Not Shipped'
    order.has_shipped = true; order.save
    expect(order.shipping_status).to eq 'Shipped'
  end

  it "should not save with an invalid email" do
    order = FactoryGirl.build(:order, email: '@@dss.')
    order.save
    expect(order.errors.full_messages.first).to eq 'Email Address is invalid'
  end
end