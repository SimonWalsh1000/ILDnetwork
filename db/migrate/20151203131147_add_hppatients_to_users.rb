class AddHppatientsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hppatients, :integer
  end
end
