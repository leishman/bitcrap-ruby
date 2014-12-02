class Order < ActiveRecord::Base
  has_one :shipping_address
  accepts_nested_attributes_for :shipping_address

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, :email, presence: true
end
