class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.references :artist

      t.timestamps(null:false)
    end
  end
end
