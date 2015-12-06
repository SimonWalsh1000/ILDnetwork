class AddOtherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :other, :integer
  end
end
