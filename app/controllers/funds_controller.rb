class FundsController < ApplicationController
  def index
    @funds = Fund.all
  end

  def new
    @fund = Fund.new
    @user = User.find(params[:user_id])
  end

  def create
    @fund = Fund.new(fund_params)
    @user = User.find(params[:user_id])
    raise params.inspect
      if @fund.save
        redirect_to user_funds_path(@user)
      else
        redirect_to new_user_fund_path
      end
  end

  def show
    if params[:user_id]
      @funds = User.find(params[:user_id]).funds
    else
      @funds = Fund.all
    end
  end

  private

  def fund_params
    params.require(:fund).permit(:name, :industry, :strategy,
      investment_ids:[], investments_attributes: [:symbol])
  end
end
