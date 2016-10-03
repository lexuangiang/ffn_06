class CreateRateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :rate_scores do |t|
      t.float :rate_score
      t.references :score, foreign_key: true

      t.timestamps
    end
  end
end
