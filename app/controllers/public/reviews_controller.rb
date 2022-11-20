class Public::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      @bath_congestion = Congestion.new(review_params[:bath_congestion_attributes])
      @bath_congestion.review_id = @review.id
      @bath_congestion.save
      @rest_area_congestion = Congestion.new(review_params[:rest_area_congestion_attributes])
      @rest_area_congestion.review_id = @review.id
      @rest_area_congestion.save
      redirect_to reviews_index_bathhouse_path(@review.bathhouse_id)
    else
      @bathhouse = Bathhouse.find(@review.bathhouse_id)
      redirect_to bathhouse_path(@review.bathhouse_id)
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
      :congestion_situation_rest_area,
      :image,
       bath_congestion_attributes: [:classification, :time_zone, :congestion_situation],
       rest_area_congestion_attributes: [:classification, :time_zone, :congestion_situation]
      )
  end
end
