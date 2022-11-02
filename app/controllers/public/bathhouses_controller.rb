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
    #@gender_man = Gender.new()
    #@gender_man.sex = 'man'
    #byebug
    @gender_man_fetures = Feature.find(params[:bathhouse][:gender_man_attributes][:feature_ids].compact_blank)

    #@gender_woman = @bathhouse.genders.new(bathhouse_params[:gender_woman_attributes])
    #@gender_woman.sex = 'woman'
    @gender_woman_features = Feature.find(params[:bathhouse][:gender_woman_attributes][:feature_ids].compact_blank)

    #@gender_be_common = @bathhouse.genders.new(bathhouse_params[:gender_be_common_attributes])
    # @gender_be_common.sex = 'be_common'
    @gender_be_common_fetures = Feature.find(params[:bathhouse][:gender_be_common_attributes][:feature_ids].compact_blank)
  end

  def create_confirm
    #@gender = gender_men_attributes.all
    @bathhouse = Bathhouse.new(bathhouse_params_2)
    #@gender_man_fetures = Feature.find(params[:bathhouse][:gender_man_attributes][:feature_ids].compact_blank)
    man_ids =  params[:gender_man_feature_ids].split(" ").map {|id| id.to_i}
    man =  Feature.where(id: man_ids)
    woman_ids =  params[:gender_woman_feature_ids].split(" ").map {|id| id.to_i}
    woman =  Feature.where(id: woman_ids)
    common_ids =  params[:gender_be_common_feature_ids].split(" ").map {|id| id.to_i}
    common =  Feature.where(id: common_ids)
   
    @gender_man_bath_facilities =  man.where(category: 'bath_facilities')
    @gender_man_sauna = man.where(category: 'sauna')
  

    #@gender_woman_features = Feature.find(params[:bathhouse][:gender_woman_attributes][:feature_ids].compact_blank)
    @gender_woman_bath_facilities = woman.where(category: 'bath_facilities')
    @gender_woman_sauna = woman.where(category: 'sauna')

    #@gender_be_common_fetures = Feature.find(params[:bathhouse][:gender_be_common_attributes][:feature_ids].compact_blank)
    @other = common.where(category: 'other')
    @building_facilities = common.where(category: 'building_facilities')

    @index = 0
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
#      gender_man_attributes: [:feature_ids],
#      gender_woman_attributes: [:feature_ids],
#      gender_be_common_attributes: [:feature_ids]
      )
  end
  
    def bathhouse_params_2
    params.permit(
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
#      gender_man_attributes: [:feature_ids],
#      gender_woman_attributes: [:feature_ids],
#      gender_be_common_attributes: [:feature_ids]
      )
  end

end
