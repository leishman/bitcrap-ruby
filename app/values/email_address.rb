class EmailAddress

  EMAIL_REGEXP = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def initialize(address)
    @address = address
  end

  def valid?
    !!(@address =~ EMAIL_REGEXP)
  end
end