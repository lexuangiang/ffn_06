class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :player_name
      t.string :nationality
      t.string :position
      t.float :height
      t.float :weight
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
