class CreateClockIns < ActiveRecord::Migration[8.0]
  def change
    create_table :clock_ins do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :clocked_at

      t.timestamps
    end
  end
end
