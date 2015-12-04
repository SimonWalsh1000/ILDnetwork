class CreateRheumatologists < ActiveRecord::Migration
  def change
    create_table :rheumatologists do |t|

      t.timestamps null: false
    end
  end
end
