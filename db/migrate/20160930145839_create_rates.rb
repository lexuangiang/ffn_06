class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.float :home_rate
      t.float :away_rate
      t.references :category_match_rate, foreign_key: true

      t.timestamps
    end
  end
end
