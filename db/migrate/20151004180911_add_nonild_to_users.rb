class AddNonildToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nonild, :integer
  end
end
