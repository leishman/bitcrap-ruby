class ShippingAddress < ActiveRecord::Base
  belongs_to :order
  validates :address_line_1, :address_line_2, :city, :state, :zip_code, presence: true
end
