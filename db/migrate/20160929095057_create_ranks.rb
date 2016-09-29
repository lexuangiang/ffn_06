class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.integer :score
      t.references :club, index: true, foreign_key: true
      t.references :session, index: true, foreign_key: true

      t.timestamps
    end
  end
end
