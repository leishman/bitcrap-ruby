class Order < ActiveRecord::Base
  has_one :shipping_address
  accepts_nested_attributes_for :shipping_address

  VALID_AMOUNTS = [1, 2, 5, 10]

  before_create :set_secret_id, :set_ref_id
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, :email, :status, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }, inclusion: { in: VALID_AMOUNTS }
  validate :email_must_be_valid

  def shipping_status
    has_shipped ? 'Shipped' : 'Not Shipped'
  end

  private

  def set_secret_id
    self.secret_id = SecureRandom.urlsafe_base64
  end

  def set_ref_id
    self.ref_id = SecureRandom.hex(9)
  end

  def email_must_be_valid
    unless EmailAddress.new(self.email).valid?
      errors.add :email
    end
  end
end
