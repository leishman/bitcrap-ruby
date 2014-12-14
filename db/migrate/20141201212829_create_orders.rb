class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :amount
      t.string  :currency, default: 'usd'
      t.string  :name
      t.string  :email
      t.string  :notes
      t.string  :secret_id
      t.string  :ref_id
      t.string  :status, default: 'unpaid'
      t.boolean :has_shipped, default: false
      t.text  :shipping_notes
      t.timestamps
    end
    add_index :orders, :email
  end
end