class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :buyer
      t.string :description
      t.integer :price
      t.integer :items_count
      t.integer :total_price
      t.string :seller_address
      t.string :seller

      t.timestamps
    end
  end
end
