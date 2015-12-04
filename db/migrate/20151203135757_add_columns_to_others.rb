class AddColumnsToOthers < ActiveRecord::Migration
  def change
    add_column :others, :experience, :integer
    add_column :others, :kind, :text
  end
end
