class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :device
      t.string :browser
      t.string :ip_address
      t.float :latitude
      t.float :longitude
      t.string :location
      t.string :platform
      t.string :mobile
      t.string :city
      t.string :country
      t.string :referrer
      t.string :version



      t.timestamps null: false
    end
  end
end
