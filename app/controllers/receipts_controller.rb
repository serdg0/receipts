class ReceiptsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @receipts = Receipt.all
  end

  def import
    p params[:receipts]
    Receipt.import(params[:receipts])
    redirect_to root_url, notice: "Products imported."
  end
end
