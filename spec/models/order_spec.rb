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

  it "should not allow more orders to be created than the daily maximum" do

    # create two orders
    order_1 = FactoryGirl.create(:order)
    order_2 = FactoryGirl.create(:order)
    expect(Order.count).to eq 2

    # stub out daily limit to equal 1
    stub_const("Order::DAILY_LIMIT", 1)
    expect(Order::DAILY_LIMIT).to eq 1

    # expect creation of third order to fail
    expect do
      FactoryGirl.create(:order)
    end.to raise_error

    # expect updating of second order to still be allowed
    expect do
      order_2.update_attributes(status: 'underpaid')
    end.to change{ order_2.status }.from('unpaid').to('underpaid')
  end

  it "should give the proper daily order amount remaining" do
    n = 5
    n.times { FactoryGirl.create(:order) }
    expect(Order.amount_remaining).to eq(Order::DAILY_LIMIT - n)
  end
end