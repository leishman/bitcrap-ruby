class BitcrapMailer < ActionMailer::Base
  default from: "support@bitcrap.com"

  # Input: Order object
  def order_confirmation(order)
    @order = order
    @address = order.shipping_address
    mail(to: @order.email, subject: "Your Bitcrap Order")
  end

  def admin_warning(msg)
    @msg = msg
    mail(to: 'leishman3@gmail.com', subject: "#{Rails.env} | Issue on server ")
  end
end

