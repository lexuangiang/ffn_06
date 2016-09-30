class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.float :rate_home
      t.float :rate_away
      t.references :category_match_rate, index: true, foreign_key: true

      t.timestamps
    end
  end
end
