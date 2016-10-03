class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.time :match_time
      t.integer :home_goal
      t.integer :away_goal
      t.boolean :match_status
      t.integer :home_id
      t.integer :away_id
      t.references :rate, foreign_key: true
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
