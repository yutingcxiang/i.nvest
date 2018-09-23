class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def create
    #create form
  end

  def show
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def edit
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def update
    #create form
  end

  def destroy
    @portfolio = Portfolio.find_by(id: params[:id])
    @Portfolio.destroy
    redirect_to '/'
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :strategy, :email)
  end
end
