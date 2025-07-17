class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      
      t.string :last_name, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name_kana, null: false, default: ""
      t.string :first_name_kana, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :telephone_number, null: false, default: ""
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
