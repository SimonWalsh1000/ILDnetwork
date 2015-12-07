class ConvertColumnsToStrings < ActiveRecord::Migration
  def change
    remove_column :users, :ipf
    remove_column :users, :cases
    add_column :users, :ipf, :string
    add_column :users, :cases, :string
  end
end
