class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :amount
      t.string  :currency, default: 'usd'
      t.string  :notes
      t.timestamps
    end
  end
end
