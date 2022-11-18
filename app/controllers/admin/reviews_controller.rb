class Admin::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to reviews_index(@review.bathhouse_id)
    else
      @bathhouse = Bathhouse.find(@review.bathhouse_id)
      redirect_to reviews_index(@review.bathhouse_id)
    end
  end

  def index
  end

  def destroy
  end


  private

  def review_params
    params.require(:review).permit(
      :bathhouse_id,
      :visiting_date,
      :satisfaction,
      :body,
      :time_zone_bath,
      :congestion_situation_man,
      :congestion_situation_woman,
      :time_zone_rest_area,
      :congestion_situation_rest_area
      )
  end
end
