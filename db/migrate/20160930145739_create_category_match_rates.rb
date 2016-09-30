class CreateCategoryMatchRates < ActiveRecord::Migration[5.0]
  def change
    create_table :category_match_rates do |t|
      t.string :cmr_name

      t.timestamps
    end
  end
end
