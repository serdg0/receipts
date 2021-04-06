require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do
  context 'validations' do
    it { have_many :receipts }
  end

  context 'method' do
    user = FactoryBot.create(:user) do |user|
      FactoryBot.create_list(:receipt, 4, items_count: 10, price: 5, user: user)
    end

    user_with_no_receipts = FactoryBot.create(:user)

    it "should calculate the total income" do
      expect(user.total_income).to eq(200.00)      
    end

    it "should return nil when has no receipts" do
      expect(user_with_no_receipts.total_income).to eq(nil)
    end
  end
end
