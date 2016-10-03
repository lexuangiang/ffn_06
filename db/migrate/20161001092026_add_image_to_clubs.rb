class AddImageToClubs < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :image, :string
  end
end
