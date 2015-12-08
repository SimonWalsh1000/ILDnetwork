class AddSkipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skip, :boolean
  end
end
