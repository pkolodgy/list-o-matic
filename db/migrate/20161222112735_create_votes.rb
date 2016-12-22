class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :points, null: false
      t.references :album
      t.references :ballot

      t.timestamps(null:false)
    end
  end
end
