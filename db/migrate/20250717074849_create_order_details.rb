class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :price
      t.integer :amount
      t.integer :making_status

      t.timestamps
    end
    add_foreign_key :order_details, :orders
    add_foreign_key :order_details, :items
  end
end
