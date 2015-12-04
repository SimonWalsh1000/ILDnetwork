class CreateRads < ActiveRecord::Migration
  def change
    create_table :rads do |t|
      t.integer :user_id
      t.integer :experience
      t.string :kind

      t.timestamps null: false
    end
  end
end
