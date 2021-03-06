class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :receipts, dependent: :destroy

  def total_income
    receipts.pluck(:total_price).inject(:+)
  end
end
