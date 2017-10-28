class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :count_sale
      t.references :item, foreign_key: true
      t.references :purchaser, foreign_key: true
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
