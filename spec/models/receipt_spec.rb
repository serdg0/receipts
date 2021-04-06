require 'rails_helper'

RSpec.describe Receipt, type: :model do
  context "associations" do
    it { belong_to :user }
  end

  context "validations" do
    it { validate_presence_of :buyer }
    it { validate_presence_of :description }
    it { validate_presence_of :price }
    it { validate_presence_of :items_count }
    it { validate_presence_of :total_price }
    it { validate_presence_of :seller_address }
    it { validate_presence_of :seller }
  end
  
end
