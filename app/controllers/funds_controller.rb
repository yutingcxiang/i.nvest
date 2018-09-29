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
    @fund = Fund.find_by(id: params[:id])
  end

  def edit
    @fund = Fund.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @fund = @user.funds.update(fund_params)
    if @fund.save
      redirect_to user_path(@user)
    else
      redirect_to edit_user_fund_path(@user, @fund)
    end
  end

  def destroy
    @fund = User.find(params[:user_id]).funds
    @fund.destroy
    redirect_to user_path(@user)
  end

  private

  def fund_params
    params.require(:fund).permit(:name, :industry, :strategy,
      investment_ids:[], new_investment: [:symbol, :user_id])
  end
end
