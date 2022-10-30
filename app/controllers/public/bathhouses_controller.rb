class Public::BathhousesController < ApplicationController
  def confirm
  end

  def new
    @bathhouse = Bathhouse.new
    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')
    @index = 0
  end

  def image
    @bathhouse = Bathhouse.new(bathhouse_params)
    @gender_man = @bathhouse.genders.new(bathhouse_params[:gender_man_attributes])
    @gender_man.sex = 'man'
    @gender_man.fetures.new(bathhouse_params[:gender_man_attributes])

    @gender_woman = @bathhouse.genders.new(bathhouse_params[:gender_woman_attributes])
    @gender_woman.sex = 'woman'
    @gender_woman.fetures.new(bathhouse_params[:gender_woman_attributes])

    @gender_be_common = @bathhouse.genders.new(bathhouse_params[:gender_be_common_attributes])
    @gender_be_common.sex = 'be_common'
    @gender_be_common.fetures.new(bathhouse_params[:gender_be_common_attributes])
  end

  def create_confirm
    @gender = gender_men_attributes.all
  end

  def create
  end

  def show
  end

  def index
  end

  def reviews_index
  end

  def congestion_situation
  end

  def edit
  end

  def edit_image
  end

  def edit_confirm
  end

  def review
  end

  def update
  end

  private
  def bathhouse_params
    params.require(:bathhouse).permit(
      :prefecture_id,
      :name,
      :postal_code,
      :address_city,
      :address_town,
      :address_building,
      :access,
      :parking_information,
      :telephone_number,
      :homepage,
      :regular_holiday,
      :opening_hours,
      :minimum_fee,
      :fee_detail,
      :special_note,
      gender_man_attributes: [:feature_ids],
      gender_woman_attributes: [:feature_ids],
      gender_be_common_attributes: [:feature_ids]
      )
  end

end
