module OrdersHelper
  def mask_email(email)
    split_email = email.split('@')
    before_at = split_email[0].split('')
    new_before_at = "#{before_at.shift}#{'*' * [(before_at.length - 1), 0].max}#{before_at.last}"
    "#{new_before_at}@#{split_email.last}"
  end
end
