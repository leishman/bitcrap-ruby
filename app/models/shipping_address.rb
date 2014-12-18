class ShippingAddress < ActiveRecord::Base
  belongs_to :order
  validates :address_line_1, :city, :state, :zip_code, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
  validates :state, inclusion: { in: ShippingAddressesHelper.us_states.map(&:second) }
end
