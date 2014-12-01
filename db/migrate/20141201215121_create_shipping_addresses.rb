class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.belongs_to :order
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country, default: 'USA'
      t.timestamps
    end
  end
end
