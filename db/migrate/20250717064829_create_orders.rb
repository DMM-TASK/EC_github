class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
    add_foreign_key :orders, :customers
  end
end
