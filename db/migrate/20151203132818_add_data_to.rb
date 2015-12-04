class AddDataTo < ActiveRecord::Migration
  def change
    add_column :rheumatologists, :user_id, :integer
    add_column :rheumatologists, :experience, :integer
    add_column :rheumatologists, :kind, :string
  end
end
