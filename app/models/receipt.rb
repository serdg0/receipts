class Receipt < ApplicationRecord

  before_create :set_total_price

  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |receipt|
  #       csv << product.attributes.valutes_at(*column_names)
  #     end
  #   end
  # end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      p "HEREEEEEEEEEEEEEEEEE"
      p row.class
      p row
      Receipt.create! self.transform_receipt(row)
    end
  end

  private_class_method def self.transform_receipt(receipt)
    {
      buyer: receipt["comprador"],
      description: receipt["descripcion del item"],
      price: receipt["precio del item"],
      items_count: receipt["total de items"],
      seller_address: receipt["direccion de vendedor"],
      seller: receipt["vendedor"]
    }
  end
  
  private

  def set_total_price
    self.total_price = items_count * price
  end
end
