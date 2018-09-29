class InvestmentsController < ApplicationController
  before_action :require_signin
  skip_before_action :require_signin, only: [:index]

  def index
    if params[:symbol]
      @investment = Investment.where('symbol LIKE ?', "%#{params[:search]}%")
    else
      @investments = Investment.all
    end
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.save
    redirect_to investments_path
  end

  def top_investments
    @top_investments = Investment.all
  end

  private

  def investment_params
    params.require(:investment).permit(:symbol, :user_id, :fund_id, :search)
  end
end
