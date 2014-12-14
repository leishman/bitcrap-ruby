class BitcrapMailerPreview < ActionMailer::Preview
  def order_confirmation
    BitcrapMailer.order_confirmation(Order.first)
  end
end