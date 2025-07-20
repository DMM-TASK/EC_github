class DropUsersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :users, if_exists: true
  end

  def down
  end
end
