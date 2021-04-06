class Receipt < ApplicationRecord
  belongs_to :user

  validates :buyer, :description, :price, :items_count, 
            :seller_address, :seller, presence: true

  before_create :set_total_price

  def self.import(file, id)
    spreadsheet = self.open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      Receipt.create! self.transform_receipt(row, id)
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

  private_class_method def self.transform_receipt(receipt, id)
    {
      user_id: id,
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
