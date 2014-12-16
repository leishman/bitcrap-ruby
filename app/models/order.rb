class Order < ActiveRecord::Base
  has_one :shipping_address
  accepts_nested_attributes_for :shipping_address

  before_create :set_secret_id, :set_ref_id
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, :email, :status, presence: true


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
end
