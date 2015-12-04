class AddOthersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ipfpatients, :integer
    add_column :users, :sarcoidpatients, :integer
    add_column :users, :iippatients, :integer
    add_column :users, :ctdpatients, :integer
    add_column :users, :unclasspatients, :integer
  end
end
