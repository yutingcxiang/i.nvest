class InvestmentsController < ApplicationController
  before_action :require_signin
  skip_before_action :require_signin, only: [:index]

  def index
    @investments = Investment.all
  end

  def new
    @user = User.find(params[:user_id])
    @investment = @user.investments.build
  end

  def create
    @user = User.find(params[:user_id])
    @investment = @user.investments.build(investment_params)
    if @investment.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @investment = Investment.find_by(id: params[:id])
  end

  def destroy
    @investment = Investment.find(params[fund_params])
    @investment.destroy
    redirect_to user_path(@user)
  end

  private

  def investment_params
    params.require(:investment).permit(:quantity, :price, :user_id, :fund_id,
      new_fund: [:symbol])
  end
end
