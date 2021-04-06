require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it do
      have_many :receipts
    end
  end
end
