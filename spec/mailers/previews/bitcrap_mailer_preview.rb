class BitcrapMailerPreview < ActionMailer::Preview
  def order_confirmation
    BitcrapMailer.order_confirmation(Order.first)
  end

  def admin_warning
    BitcrapMailer.admin_warning('test admin warning message')
  end
end