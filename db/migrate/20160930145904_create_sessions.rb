class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :session_name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
