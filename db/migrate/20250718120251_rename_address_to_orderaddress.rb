class RenameAddressToOrderaddress < ActiveRecord::Migration[6.1]
  def change
    rename_table :addresses, :orderaddresses
  end
end
