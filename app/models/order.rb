class Order < ActiveRecord::Base
  has_one :shipping_address
  accepts_nested_attributes_for :shipping_address

  before_create :set_uid
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, :email, :status, presence: true

  private

  def set_uid
    self.uid = SecureRandom.hex
  end
end
