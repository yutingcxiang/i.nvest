class InvestmentsController < ApplicationController
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
    @investment = Investment.find_by(id: params[:id])
  end

  def destroy
    @investment = Investment.find_by(id: params[:id])
    @investment.destroy
    redirect_to '/'
  end

  private

  def investment_params
    params.require(:investment).permit(:symbol, :user_id, :fund_id)
  end
end
