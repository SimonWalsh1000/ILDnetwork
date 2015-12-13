class AddTeleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teleimaging, :string
    add_column :users, :telepath, :string
  end
end
