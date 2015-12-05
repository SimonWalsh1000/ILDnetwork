class AddSoloToUsers < ActiveRecord::Migration
  def change
    add_column :users, :practice, :string
  end
end
