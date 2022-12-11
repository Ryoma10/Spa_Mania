class Public::FavouritesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    favourite = current_user.favourites.new(review_id: @review.id)
    favourite.save
    # redirect_to review_path(review.id)
  end

  def destroy
    @review = Review.find(params[:review_id])
    #byebug
    favourite = current_user.favourites.find_by(review_id: @review.id)
    favourite.destroy
    # redirect_to review_path(review.id)
  end
end