class Public::FavouriteBathhousesController < ApplicationController
  def create
    @bathhouse = Bathhouse.find(params[:bathhouse_id])
    favourite_bathhouse = current_user.favourite_bathhouses.new(bathhouse_id: @bathhouse.id)
    favourite_bathhouse.save
    # redirect_to bathhouse_path(bathhouse.id)
  end

  def destroy
    @bathhouse = Bathhouse.find(params[:bathhouse_id])
    favourite_bathhouse = current_user.favourite_bathhouses.find_by(bathhouse_id: @bathhouse.id)
    favourite_bathhouse.destroy
    # redirect_to bathhouse_path(bathhouse.id)
  end
end