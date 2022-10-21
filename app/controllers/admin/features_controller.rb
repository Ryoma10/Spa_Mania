class Admin::FeaturesController < ApplicationController
  def index
    @feature = Feature.new
    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')
  end

  def create
    feature = Feature.new(feature_params)
    feature.save
    redirect_to admin_features_path
  end

  def destroy
    feature = Feature.find(params[:id])
    feature.destroy
    redirect_to admin_features_path
  end

  private
  # ストロングパラメータ
  def feature_params
    params.require(:feature).permit(:name, :category)
  end
end