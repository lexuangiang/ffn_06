class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.float :home_coin
      t.float :away_coin
      t.boolean :bet_status
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
      t.references :score, foreign_key: true

      t.timestamps
    end
  end
end
