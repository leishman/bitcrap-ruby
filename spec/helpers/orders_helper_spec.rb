require 'rails_helper'

describe OrdersHelper do
  context "#mask_email" do
    it "should mask only the first part of an email" do
      expect(mask_email('leishman@maicoin.com')).to eq 'l******n@maicoin.com'
    end

    it "should handle a really short email" do
      expect(mask_email('lel@maicoin.com')).to eq 'l*l@maicoin.com'
      expect(mask_email('le@maicoin.com')).to eq 'le@maicoin.com'
      expect(mask_email('l@maicoin.com')).to eq 'l@maicoin.com'
    end
  end
end