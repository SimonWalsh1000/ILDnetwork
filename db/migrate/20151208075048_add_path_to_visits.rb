class AddPathToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :path, :string
  end
end
