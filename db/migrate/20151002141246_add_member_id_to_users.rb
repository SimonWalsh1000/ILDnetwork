class AddMemberIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_id, :integer, index: true
  end
end
