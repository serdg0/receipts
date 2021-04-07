class ChangePriceAndTotalPriceToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :receipts, :price, :float
    change_column :receipts, :total_price, :float
  end
end
