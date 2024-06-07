class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :nickname
      t.string :avatar
      t.string :provider
      t.string :open_id
      t.string :role, default: "user"

      t.timestamps
    end
  end
end
