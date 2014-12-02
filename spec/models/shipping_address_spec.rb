require 'rails_helper'

describe ShippingAddress do
  attrs = [:address_line_1, :city, :state, :zip_code]
  attrs.each do |a|
    it { should validate_presence_of a }
  end
end