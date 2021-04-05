class ReceiptsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @receipts = Receipt.all
    @total_income = Receipt.total_income
  end

  def import
    Receipt.import(params[:receipts])
    redirect_to root_url, notice: "Receipts imported."
  end
end
