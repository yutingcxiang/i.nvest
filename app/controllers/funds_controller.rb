class FundsController < ApplicationController
  def index
    @funds = Fund.all
  end

  def new
    @user = User.find(params[:user_id])
    @fund = @user.funds.build
  end

  def create
    @user = User.find(params[:user_id])
    @fund = @user.funds.build(fund_params)
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
    params.require(:fund).permit(:name, :industry, :strategy, :user_id,
      funds_attributes: [:symbol])
  end
end
