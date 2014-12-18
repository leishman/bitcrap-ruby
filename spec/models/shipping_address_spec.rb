require 'rails_helper'

describe ShippingAddress do
  attrs = [:address_line_1, :city, :state, :zip_code]
  attrs.each do |a|
    it { should validate_presence_of a }
  end

  context "Zip Code" do
    it "should return the proper messages for invalid zip codes" do
      sa_1 = FactoryGirl.build(:shipping_address, zip_code: 'asdfs'); sa_1.save
      expect(sa_1.valid?).to eq false
      expect(sa_1.errors.full_messages.first).to eq 'Zip Code is not a number'

      sa_2 = FactoryGirl.build(:shipping_address, zip_code: '123'); sa_2.save
      expect(sa_2.valid?).to eq false
      expect(sa_2.errors.full_messages.first).to eq 'Zip Code is the wrong length (should be 5 characters)'

      sa_3 = FactoryGirl.build(:shipping_address, zip_code: '39041-4343'); sa_3.save
      expect(sa_3.valid?).to eq false
    end

    it "should allow a valid zip code" do
      sa_1 = FactoryGirl.create(:shipping_address, zip_code: '12345')
      expect(sa_1.valid?).to eq true
      expect(sa_1.persisted?).to eq true
    end
  end

  context "State" do
    it "should return the proper message if not a valid US state" do
      sa_1 = FactoryGirl.build(:shipping_address, state: 'ZZ'); sa_1.save
      expect(sa_1.errors.full_messages.first).to eq 'State is not included in the list'
    end

    it "should allow a valid State" do
      10.times do
        sa_1 = FactoryGirl.build(:shipping_address) # Factory uses Faker to select valid state abbr.
        expect(sa_1.valid?).to eq true
      end
    end
  end
end