class BitcrapMailer < ActionMailer::Base
  default from: '"Bitcrap" <support@bitcrap.com>'

  # Input: Order object
  def order_confirmation(order_id)
    @order = Order.find(order_id) # ruby hash object
    @address = @order.shipping_address#ruby address object
    mail(to: @order.email, bcc: 'leishman3@gmail.com', subject: "Bitcrap Order for #{@order.name}")
  end

  def admin_warning(msg)
    @msg = msg
    mail(to: 'leishman3@gmail.com', subject: "#{Rails.env} | Issue on server ")
  end
end

