class RemoveUserAvatar < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :avatar
  end
end
