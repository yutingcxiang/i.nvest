class FundsController < ApplicationController
  def index
    @funds = Fund.all
  end

  def new
    @fund = Fund.new
  end

  def create
    @fund = Fund.create(fund_params)
  end

  def show
    @fund = Fund.find_by(id: params[:id])
  end

  private

  def fund_params
    params.require(:fund).permit(:symbol, :category, :industry, :description)
  end
end
