class AddUseridToOthers < ActiveRecord::Migration
  def change
    add_column :others, :user_id, :integer
  end
end
