class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
