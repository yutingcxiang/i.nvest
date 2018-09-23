class FundsController < ApplicationController
  def index
    @funds = Fund.all
  end

  def new
    @fund = Fund.new
  end

  def create
    #create form
  end

  def show
    @fund = Fund.find_by(id: params[:id])
  end

  private

  def fund_params
    params.require(:fund).permit(:name, :quantity, :price, :type)
  end
end
