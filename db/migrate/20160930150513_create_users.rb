class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.boolean :isadmin
      t.float :coin

      t.timestamps
    end
  end
end
