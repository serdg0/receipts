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
    spreadsheet = self.open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      Receipt.create! self.transform_receipt(row)
    end
  end
  
  private_class_method def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      when ".ods" then Roo::OpenOffice.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
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
