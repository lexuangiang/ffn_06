class CreateRateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :rate_scores do |t|
      t.integer :rate_score
      t.references :score, index: true, foreign_key: true

      t.timestamps
    end
  end
end
