class AddIsoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :iso, :string
  end
end
