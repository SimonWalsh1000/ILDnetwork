class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.integer :user_id
      t.integer :experience
      t.string :kind

      t.timestamps null: false
    end
  end
end
