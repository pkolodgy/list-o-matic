class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.integer :voter_id, null: false
      t.references :list

      t.timestamps(null:false)
    end
  end
end
