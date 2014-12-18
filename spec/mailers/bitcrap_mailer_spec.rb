require 'rails_helper'

describe BitcrapMailer do
  context "Admin Warning Email" do
    it "should enqueue an admin warning when delayed" do
      expect do
        BitcrapMailer.delay.admin_warning('This is a test')
      end.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end
  end

  it "should send an admin email with the proper content and recipient" do
    msg = 'This is a test'
    BitcrapMailer.admin_warning(msg).deliver
    expect(last_email_body).to include msg
  end

  context "Order Confirmation email" do
    before :each do
      @order = FactoryGirl.create(:shipping_address).order
    end

    it "should enqueue an order confirmation email when delayed" do
      expect do
        BitcrapMailer.delay.order_confirmation(@order.id)
      end.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
    end

    it "should send an order confirmation email with the proper content" do
      BitcrapMailer.order_confirmation(@order.id).deliver
      expect(last_email_body).to include @order.name
    end
  end
end