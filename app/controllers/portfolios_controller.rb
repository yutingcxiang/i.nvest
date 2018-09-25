class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new(user_id: params[:user_id])
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      redirect_to new_portfolio_path
    end
  end

  def show
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def edit
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def update
    @portfolio = Portfolio.find_by(id: params[:id])
    @portfolio.update(portfolio_params)
    redirect_to portfolio_path(@portfolio)
  end

  def destroy
    @portfolio = Portfolio.find_by(id: params[:id])
    @Portfolio.destroy
    redirect_to '/'
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :strategy, :user_id)
  end
end
