class BitcrapMailer < ActionMailer::Base
  default from: "support@bitcrap.com"

  # Input: order
  def order_confirmation(order)
    @order = order
    @address = order.shipping_address
    mail(to: @order.email, subject: "Your Bitcrap Order")
  end
end
