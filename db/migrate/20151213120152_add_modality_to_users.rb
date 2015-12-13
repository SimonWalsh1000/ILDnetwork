class AddModalityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :imaging, :string
    add_column :users, :histopathology, :string
    add_column :users, :teleconference, :string
  end
end
