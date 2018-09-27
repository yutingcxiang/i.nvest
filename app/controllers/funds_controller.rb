class FundsController < ApplicationController
  before_action :require_login

  def index
    @funds = Fund.all
  end

  def new
    @user = User.find(params[:user_id])
    @fund = @user.funds.build
  end

  def create
    @user = User.find(params[:user_id])
    @fund = @user.funds.create(fund_params)
    raise params.inspect
    redirect_to user_path(@user)
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
      investment_ids:[], new_investment: [:symbol, :user_id])
  end
end
