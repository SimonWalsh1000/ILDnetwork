class AddIpFtoUsers < ActiveRecord::Migration
  def change
    add_column :users, :ipf, :integer
  end
end
