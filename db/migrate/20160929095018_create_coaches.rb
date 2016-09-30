class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :coach_name
      t.date :birth_day
      t.string :nationality

      t.timestamps
    end
  end
end
