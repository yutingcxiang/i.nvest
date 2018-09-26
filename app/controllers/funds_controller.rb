class FundsController < ApplicationController
  def index
    @funds = Fund.all
  end

  def new
    @fund = Fund.new
  end

  def create
    @user = User.find(params[:user_id])
    @fund = User.funds.build(fund_params)
      if @user.id == current_user.id && @fund.save
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
    params.require(:fund).permit(:name, :industry, :strategy)
  end
end
