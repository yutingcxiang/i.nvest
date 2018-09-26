class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.create(asset_params)
    redirect_to assets_path
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
    params.require(:asset).permit(:symbol)
  end
end
