class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.integer :creator_id, null: false
      t.datetime :end_time, null: false

      t.timestamps(null:false)
    end
  end
end
