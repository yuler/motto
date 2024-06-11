class ChangeUsers < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :role, :integer, default: 0
    change_column :users, :provider, :integer
    add_index :users, :open_id
  end
end
