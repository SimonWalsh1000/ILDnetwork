class AddPersonalDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kind, :string
    add_column :users, :experience, :integer
  end
end
