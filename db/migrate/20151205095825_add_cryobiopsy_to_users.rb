class AddCryobiopsyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cryobiopsy, :string
  end
end
