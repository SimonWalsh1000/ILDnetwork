class AddBiopsyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biopsy, :integer
  end
end
