class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :specialist
      t.string :institute_type
      t.boolean :radiologist
      t.boolean :pathologist
      t.string :schedule, :default => "Weekly"
      t.integer :cases
      t.timestamps null: false
    end
  end
end
