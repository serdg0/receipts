class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :buyer
      t.string :description
      t.int :price
      t.int :items_count
      t.int :total_price
      t.string :seller_address
      t.string :seller

      t.timestamps
    end
  end
end
