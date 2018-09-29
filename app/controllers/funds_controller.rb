class FundsController < ApplicationController
  before_action :require_signin
  skip_before_action :require_signin, only: [:index]

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
    if @fund.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    if params[:user_id]
      @fund = User.find(params[:user_id]).funds
    else
      @funds = Fund.all
    end
  end

  def destroy
    @fund = User.find(params[:user_id]).funds
    @fund.destroy
    redirect_to user_path(@user)
  end

  private

  def fund_params
    params.require(:fund).permit(:fund_name, :industry, :strategy,
      investment_ids:[], new_investment: [:symbol, :user_id])
  end
end
