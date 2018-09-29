class InvestmentsController < ApplicationController
  before_action :require_signin
  skip_before_action :require_signin, only: [:index]

  def index
    @investments = Investment.all
  end

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.create(investment_params)
    redirect_to investments_path
  end

  def show
    @invest = Investment.find_by(id: params[:id])
  end

  def top_investments
    
  end

  private

  def investment_params
    params.require(:investment).permit(:symbol, :user_id, :fund_id)
  end
end
