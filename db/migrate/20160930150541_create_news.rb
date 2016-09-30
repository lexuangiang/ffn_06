class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.references :category_news, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
