class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def index
    @receipts = current_user.receipts
    @total_income = current_user.total_income
  end

  def import
    Receipt.import(params[:receipts], current_user.id)
    redirect_to root_url, notice: "Receipts imported."
  end
end
