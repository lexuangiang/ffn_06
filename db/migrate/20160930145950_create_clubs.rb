class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.string :location
      t.string :stadium
      t.string :coach
      t.date :founding

      t.timestamps
    end
  end
end
