class ShippingAddress < ActiveRecord::Base
  belongs_to :order
  validates :address_line_1, :city, :state, :zip_code, presence: true
  validates :address_line_1, :address_line_2, :city, length: { maximum: 60 }
  validates :zip_code, numericality: { only_integer: true, greater_than: 0 }, length: { is: 5 }
  validates :state, inclusion: { in: ShippingAddressesHelper.us_states.map(&:second) }
end
