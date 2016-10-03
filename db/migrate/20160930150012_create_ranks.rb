class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.string :rank_score
      t.references :club, foreign_key: true
      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end
