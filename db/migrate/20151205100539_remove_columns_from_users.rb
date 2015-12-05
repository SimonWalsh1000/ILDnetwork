class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :type
    remove_column :users, :solo
    remove_column :users, :mdt
    remove_column :users, :refer
  end
end
