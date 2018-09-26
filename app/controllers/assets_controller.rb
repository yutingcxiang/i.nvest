class AssetsController < ApplicationController
  def index
    @assets = Asset.all
    @user = current_user
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(asset_params)
    @asset.user = current_user
    if @asset.save
      redirect_to user_portfolios_path(@asset)
    else
      redirect_to new_user_portfolio_path
    end
  end

  def show
    @asset = Asset.find_by(id: params[:id])
  end

  def edit
    @asset = Asset.find_by(id: params[:id])
  end

  def update
    @asset = Asset.find_by(id: params[:id])
    @asset.update(asset_params)
    redirect_to user_assets_path(@asset)
  end

  def destroy
    @asset = Asset.find_by(id: params[:id])
    @asset.destroy
    redirect_to '/'
  end

  private

  def asset_params
    params.require(:asset).permit(:symbol, :company)
  end
end
