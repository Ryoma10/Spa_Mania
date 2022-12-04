class Public::BathhousesController < ApplicationController
  before_action :set_q

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
    @gender_man_fetures = Feature.find(params[:bathhouse][:gender_man_attributes][:feature_ids].compact_blank)

    #@gender_woman = @bathhouse.genders.new(bathhouse_params[:gender_woman_attributes])
    #@gender_woman.sex = 'woman'
    @gender_woman_features = Feature.find(params[:bathhouse][:gender_woman_attributes][:feature_ids].compact_blank)

    #@gender_be_common = @bathhouse.genders.new(bathhouse_params[:gender_be_common_attributes])
    # @gender_be_common.sex = 'be_common'
    @gender_be_common_fetures = Feature.find(params[:bathhouse][:gender_be_common_attributes][:feature_ids].compact_blank)
  end

  def create_confirm
    @confirm = Confirm.new()
    @confirm.bathhouse_image_main = params[:bathhouse][:bathhouse_image_main]
    @confirm.bathhouse_image_sub1 = params[:bathhouse][:bathhouse_image_sub1]
    @confirm.bathhouse_image_sub2 = params[:bathhouse][:bathhouse_image_sub2]
    @confirm.bathhouse_image_sub3 = params[:bathhouse][:bathhouse_image_sub3]
    @confirm.bathhouse_image_sub4 = params[:bathhouse][:bathhouse_image_sub4]
    @confirm.bathhouse_image_sub5 = params[:bathhouse][:bathhouse_image_sub5]
    @confirm.save

    #@gender = gender_men_attributes.all
    @bathhouse = Bathhouse.new(bathhouse_params_2)

    #@gender_man_fetures = Feature.find(params[:bathhouse][:gender_man_attributes][:feature_ids].compact_blank)
    man_feature_ids =  params[:bathhouse][:gender_man_feature_ids].split(" ").map {|id| id.to_i}
    @man_feature =  Feature.where(id: man_feature_ids)
    woman_feature_ids =  params[:bathhouse][:gender_woman_feature_ids].split(" ").map {|id| id.to_i}
    @woman_feature =  Feature.where(id: woman_feature_ids)
    be_common_ids =  params[:bathhouse][:gender_be_common_feature_ids].split(" ").map {|id| id.to_i}
    @be_common =  Feature.where(id: be_common_ids)

    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')

    @gender_man_bath_facilities = @man_feature.where(category: 'bath_facilities')
    @gender_man_sauna = @man_feature.where(category: 'sauna')


    #@gender_woman_features = Feature.find(params[:bathhouse][:gender_woman_attributes][:feature_ids].compact_blank)
    @gender_woman_bath_facilities = @woman_feature.where(category: 'bath_facilities')
    @gender_woman_sauna = @woman_feature.where(category: 'sauna')

    #@gender_be_common_fetures = Feature.find(params[:bathhouse][:gender_be_common_attributes][:feature_ids].compact_blank)
    @other = @be_common.where(category: 'other')
    @building_facilities = @be_common.where(category: 'building_facilities')

  end

  def create
    @bathhouse = Bathhouse.new(bathhouse_params_2)
    @bathhouse.user_id = current_user.id
    @confirm = Confirm.find(confirm_params[:confirm_id])
#    @bathhouse.bathhouse_image_main = @confirm.bathhouse_image_main
#    @bathhouse.bathhouse_image_sub1 = @confirm.bathhouse_image_sub1
#    @bathhouse.bathhouse_image_sub2 = @confirm.bathhouse_image_sub2
#    @bathhouse.bathhouse_image_sub3 = @confirm.bathhouse_image_sub3
#    @bathhouse.bathhouse_image_sub4 = @confirm.bathhouse_image_sub4
#    @bathhouse.bathhouse_image_sub5 = @confirm.bathhouse_image_sub5
    @bathhouse.save
    @confirm.destroy

    @bathhouse_gender_man = Gender.new
    @bathhouse_gender_man.bathhouse_id = @bathhouse.id
    @bathhouse_gender_man.sex = 0
    @bathhouse_gender_man.save
    man_feature_ids =  params[:bathhouse][:gender_man_feature_ids].split(" ").map {|id| id.to_i}
    @man_feature =  Feature.where(id: man_feature_ids)
    @man_feature.each do |man_feature|
      @bathhouse_gender_man_category = Category.new
      @bathhouse_gender_man_category.gender_id = @bathhouse_gender_man.id
      @bathhouse_gender_man_category.feature_id = man_feature.id
      @bathhouse_gender_man_category.save
    end

    @bathhouse_gender_woman = Gender.new
    @bathhouse_gender_woman.bathhouse_id = @bathhouse.id
    @bathhouse_gender_woman.sex = 1
    @bathhouse_gender_woman.save
    woman_feature_ids =  params[:bathhouse][:gender_woman_feature_ids].split(" ").map {|id| id.to_i}
    @woman_feature =  Feature.where(id: woman_feature_ids)
    @woman_feature.each do |woman_feature|
      @bathhouse_gender_woman_category = Category.new
      @bathhouse_gender_woman_category.gender_id = @bathhouse_gender_woman.id
      @bathhouse_gender_woman_category.feature_id = woman_feature.id
      @bathhouse_gender_woman_category.save
    end

    @bathhouse_be_common = Gender.new
    @bathhouse_be_common.bathhouse_id = @bathhouse.id
    @bathhouse_be_common.sex = 2
    @bathhouse_be_common.save
    be_common_ids =  params[:bathhouse][:gender_be_common_feature_ids].split(" ").map {|id| id.to_i}
    @be_common =  Feature.where(id: be_common_ids)
    @be_common.each do |be_common_feature|
      @bathhouse_be_common_category = Category.new
      @bathhouse_be_common_category.gender_id = @bathhouse_be_common.id
      @bathhouse_be_common_category.feature_id = be_common_feature.id
      @bathhouse_be_common_category.save
    end
    redirect_to bathhouse_path(@bathhouse.id)

  end

  def show
    @bathhouse = Bathhouse.find(params[:id])
    @gender = Gender.where(bathhouse_id: @bathhouse.id)
    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')

    bathhouse_gender_man = @gender.find_by(sex: 0)
    bathhouse_gender_woman = @gender.find_by(sex: 1)
    bathhouse_gender_be_common = @gender.find_by(sex: 2)

    gender_man_category = Category.where(gender_id: bathhouse_gender_man.id)
    gender_woman_category= Category.where(gender_id: bathhouse_gender_woman.id)
    gender_be_common_category = Category.where(gender_id: bathhouse_gender_be_common.id)

    gender_man_bath_facilities = gender_man_category.where(feature_id: @bath_facilities.ids)
    gender_man_sauna = gender_man_category.where(feature_id: @sauna.ids)
    gender_woman_bath_facilities = gender_woman_category.where(feature_id: @bath_facilities.ids)
    gender_woman_sauna = gender_woman_category.where(feature_id: @sauna.ids)
    gender_other = gender_be_common_category.where(feature_id: @other.ids)
    gender_building_facilities = gender_be_common_category.where(feature_id: @building_facilities.ids)

    @bathhouse_man_bath_facilities = Feature.where(id: gender_man_bath_facilities.pluck(:feature_id))
    @bathhouse_man_sauna = Feature.where(id: gender_man_sauna.pluck(:feature_id))
    @bathhouse_woman_bath_facilities = Feature.where(id: gender_woman_bath_facilities.pluck(:feature_id))
    @bathhouse_woman_sauna = Feature.where(id: gender_woman_sauna.pluck(:feature_id))
    @bathhouse_other = Feature.where(id: gender_other.pluck(:feature_id))
    @bathhouse_building_facilities = Feature.where(id: gender_building_facilities.pluck(:feature_id))

    @review_satisfaction = Review.where(bathhouse_id: @bathhouse.id).where("satisfaction > ?", 0)
  end

  def index
    @bathhouses = Bathhouse.all
    @results = @q.result
    @results_page = @results.page params[:page]

    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')

    if params[:bathhouse][:feature_attributes][:feature_ids].present?
      @features = 
      @categories = Category.where(params[:bathhouse][:feature_attributes][:feature_ids].compact_blank)
      @gender = Gender.where()
      # @results_page = Bathhouse.where()@results.page params[:page]
    end
    @index = 0
  end

  def reviews_index
    @bathhouse = Bathhouse.find(params[:id])
    @review = Review.where(bathhouse_id: params[:id]).reverse_order.page params[:page]
    @review_satisfaction = Review.where(bathhouse_id: @bathhouse.id).where("satisfaction > ?", 0)
  end

  def congestion_situation
    @bathhouse = Bathhouse.find(params[:id])
    @review = Review.where(bathhouse_id: params[:id])
    @review_satisfaction = Review.where(bathhouse_id: @bathhouse.id).where("satisfaction > ?", 0)
    @review_congestion = Congestion.where(review_id: @review.ids)

    @congestion_weekend = []
    @congestion_weekday = []
    @review_congestion.each do |congestion|
      if congestion.review.visiting_date.saturday?
        @congestion_weekend = @congestion_weekend.push(congestion.id {|id| id.to_i})
      elsif congestion.review.visiting_date.sunday?
        @congestion_weekend = @congestion_weekend.push(congestion.id {|id| id.to_i})
      else
        @congestion_weekday = @congestion_weekday.push(congestion.id {|id| id.to_i})
      end
    end
    @congestion_weekend_man = Congestion.where(id: @congestion_weekend).where(classification: 0)
    @congestion_weekend_woman = Congestion.where(id: @congestion_weekend).where(classification: 1)
    @congestion_weekend_rest_area = Congestion.where(id: @congestion_weekend).where(classification: 2)

    @congestion_weekend_man_06to08 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 1)
    @congestion_weekend_man_06to08_empty = Congestion.where(id: @congestion_weekend_man_06to08).where(congestion_situation: 0)
    @congestion_weekend_man_06to08_normal = Congestion.where(id: @congestion_weekend_man_06to08).where(congestion_situation: 1)
    @congestion_weekend_man_06to08_crowded = Congestion.where(id: @congestion_weekend_man_06to08).where(congestion_situation: 2)
    @congestion_weekend_man_06to08_very_crowded = Congestion.where(id: @congestion_weekend_man_06to08).where(congestion_situation: 3)

    @congestion_weekend_man_08to10 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 2)
    @congestion_weekend_man_08to10_empty = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 0)
    @congestion_weekend_man_08to10_normal = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 1)
    @congestion_weekend_man_08to10_crowded = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 2)
    @congestion_weekend_man_08to10_very_crowded = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 3)

    @congestion_weekend_man_10to12 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 3)
    @congestion_weekend_man_10to12_empty = Congestion.where(id: @congestion_weekend_man_10to12).where(congestion_situation: 0)
    @congestion_weekend_man_10to12_normal = Congestion.where(id: @congestion_weekend_man_10to12).where(congestion_situation: 1)
    @congestion_weekend_man_10to12_crowded = Congestion.where(id: @congestion_weekend_man_10to12).where(congestion_situation: 2)
    @congestion_weekend_man_10to12_very_crowded = Congestion.where(id: @congestion_weekend_man_10to12).where(congestion_situation: 3)

    @congestion_weekend_man_12to14 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 4)
    @congestion_weekend_man_12to14_empty = Congestion.where(id: @congestion_weekend_man_12to14).where(congestion_situation: 0)
    @congestion_weekend_man_12to14_normal = Congestion.where(id: @congestion_weekend_man_12to14).where(congestion_situation: 1)
    @congestion_weekend_man_12to14_crowded = Congestion.where(id: @congestion_weekend_man_12to14).where(congestion_situation: 2)
    @congestion_weekend_man_12to14_very_crowded = Congestion.where(id: @congestion_weekend_man_12to14).where(congestion_situation: 3)

    @congestion_weekend_man_14to16 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 5)
    @congestion_weekend_man_14to16_empty = Congestion.where(id: @congestion_weekend_man_14to16).where(congestion_situation: 0)
    @congestion_weekend_man_14to16_normal = Congestion.where(id: @congestion_weekend_man_14to16).where(congestion_situation: 1)
    @congestion_weekend_man_14to16_crowded = Congestion.where(id: @congestion_weekend_man_14to16).where(congestion_situation: 2)
    @congestion_weekend_man_14to16_very_crowded = Congestion.where(id: @congestion_weekend_man_14to16).where(congestion_situation: 3)

    @congestion_weekend_man_16to18 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 6)
    @congestion_weekend_man_16to18_empty = Congestion.where(id: @congestion_weekend_man_16to18).where(congestion_situation: 0)
    @congestion_weekend_man_16to18_normal = Congestion.where(id: @congestion_weekend_man_16to18).where(congestion_situation: 1)
    @congestion_weekend_man_16to18_crowded = Congestion.where(id: @congestion_weekend_man_16to18).where(congestion_situation: 2)
    @congestion_weekend_man_16to18_very_crowded = Congestion.where(id: @congestion_weekend_man_16to18).where(congestion_situation: 3)

    @congestion_weekend_man_18to20 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 7)
    @congestion_weekend_man_18to20_empty = Congestion.where(id: @congestion_weekend_man_18to20).where(congestion_situation: 0)
    @congestion_weekend_man_18to20_normal = Congestion.where(id: @congestion_weekend_man_18to20).where(congestion_situation: 1)
    @congestion_weekend_man_18to20_crowded = Congestion.where(id: @congestion_weekend_man_18to20).where(congestion_situation: 2)
    @congestion_weekend_man_18to20_very_crowded = Congestion.where(id: @congestion_weekend_man_18to20).where(congestion_situation: 3)

    @congestion_weekend_man_20to22 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 8)
    @congestion_weekend_man_20to22_empty = Congestion.where(id: @congestion_weekend_man_20to22).where(congestion_situation: 0)
    @congestion_weekend_man_20to22_normal = Congestion.where(id: @congestion_weekend_man_20to22).where(congestion_situation: 1)
    @congestion_weekend_man_20to22_crowded = Congestion.where(id: @congestion_weekend_man_20to22).where(congestion_situation: 2)
    @congestion_weekend_man_20to22_very_crowded = Congestion.where(id: @congestion_weekend_man_20to22).where(congestion_situation: 3)

    @congestion_weekend_man_22to24 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 9)
    @congestion_weekend_man_22to24_empty = Congestion.where(id: @congestion_weekend_man_22to24).where(congestion_situation: 0)
    @congestion_weekend_man_22to24_normal = Congestion.where(id: @congestion_weekend_man_22to24).where(congestion_situation: 1)
    @congestion_weekend_man_22to24_crowded = Congestion.where(id: @congestion_weekend_man_22to24).where(congestion_situation: 2)
    @congestion_weekend_man_22to24_very_crowded = Congestion.where(id: @congestion_weekend_man_22to24).where(congestion_situation: 3)

    @congestion_weekend_man_00to02 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 10)
    @congestion_weekend_man_00to02_empty = Congestion.where(id: @congestion_weekend_man_00to02).where(congestion_situation: 0)
    @congestion_weekend_man_00to02_normal = Congestion.where(id: @congestion_weekend_man_00to02).where(congestion_situation: 1)
    @congestion_weekend_man_00to02_crowded = Congestion.where(id: @congestion_weekend_man_00to02).where(congestion_situation: 2)
    @congestion_weekend_man_00to02_very_crowded = Congestion.where(id: @congestion_weekend_man_00to02).where(congestion_situation: 3)

    @congestion_weekend_man_02to04 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 11)
    @congestion_weekend_man_02to04_empty = Congestion.where(id: @congestion_weekend_man_02to04).where(congestion_situation: 0)
    @congestion_weekend_man_02to04_normal = Congestion.where(id: @congestion_weekend_man_02to04).where(congestion_situation: 1)
    @congestion_weekend_man_02to04_crowded = Congestion.where(id: @congestion_weekend_man_02to04).where(congestion_situation: 2)
    @congestion_weekend_man_02to04_very_crowded = Congestion.where(id: @congestion_weekend_man_02to04).where(congestion_situation: 3)

    @congestion_weekend_man_04to06 = Congestion.where(id: @congestion_weekend_man).where(time_zone: 12)
    @congestion_weekend_man_04to06_empty = Congestion.where(id: @congestion_weekend_man_04to06).where(congestion_situation: 0)
    @congestion_weekend_man_04to06_normal = Congestion.where(id: @congestion_weekend_man_04to06).where(congestion_situation: 1)
    @congestion_weekend_man_04to06_crowded = Congestion.where(id: @congestion_weekend_man_04to06).where(congestion_situation: 2)
    @congestion_weekend_man_04to06_very_crowded = Congestion.where(id: @congestion_weekend_man_04to06).where(congestion_situation: 3)



    @congestion_weekend_woman_06to08 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 1)
    @congestion_weekend_woman_06to08_empty = Congestion.where(id: @congestion_weekend_woman_06to08).where(congestion_situation: 0)
    @congestion_weekend_woman_06to08_normal = Congestion.where(id: @congestion_weekend_woman_06to08).where(congestion_situation: 1)
    @congestion_weekend_woman_06to08_crowded = Congestion.where(id: @congestion_weekend_woman_06to08).where(congestion_situation: 2)
    @congestion_weekend_woman_06to08_very_crowded = Congestion.where(id: @congestion_weekend_woman_06to08).where(congestion_situation: 3)

    @congestion_weekend_woman_08to10 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 2)
    @congestion_weekend_woman_08to10_empty = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 0)
    @congestion_weekend_woman_08to10_normal = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 1)
    @congestion_weekend_woman_08to10_crowded = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 2)
    @congestion_weekend_woman_08to10_very_crowded = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 3)

    @congestion_weekend_woman_10to12 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 3)
    @congestion_weekend_woman_10to12_empty = Congestion.where(id: @congestion_weekend_woman_10to12).where(congestion_situation: 0)
    @congestion_weekend_woman_10to12_normal = Congestion.where(id: @congestion_weekend_woman_10to12).where(congestion_situation: 1)
    @congestion_weekend_woman_10to12_crowded = Congestion.where(id: @congestion_weekend_woman_10to12).where(congestion_situation: 2)
    @congestion_weekend_woman_10to12_very_crowded = Congestion.where(id: @congestion_weekend_woman_10to12).where(congestion_situation: 3)

    @congestion_weekend_woman_12to14 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 4)
    @congestion_weekend_woman_12to14_empty = Congestion.where(id: @congestion_weekend_woman_12to14).where(congestion_situation: 0)
    @congestion_weekend_woman_12to14_normal = Congestion.where(id: @congestion_weekend_woman_12to14).where(congestion_situation: 1)
    @congestion_weekend_woman_12to14_crowded = Congestion.where(id: @congestion_weekend_woman_12to14).where(congestion_situation: 2)
    @congestion_weekend_woman_12to14_very_crowded = Congestion.where(id: @congestion_weekend_woman_12to14).where(congestion_situation: 3)

    @congestion_weekend_woman_14to16 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 5)
    @congestion_weekend_woman_14to16_empty = Congestion.where(id: @congestion_weekend_woman_14to16).where(congestion_situation: 0)
    @congestion_weekend_woman_14to16_normal = Congestion.where(id: @congestion_weekend_woman_14to16).where(congestion_situation: 1)
    @congestion_weekend_woman_14to16_crowded = Congestion.where(id: @congestion_weekend_woman_14to16).where(congestion_situation: 2)
    @congestion_weekend_woman_14to16_very_crowded = Congestion.where(id: @congestion_weekend_woman_14to16).where(congestion_situation: 3)

    @congestion_weekend_woman_16to18 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 6)
    @congestion_weekend_woman_16to18_empty = Congestion.where(id: @congestion_weekend_woman_16to18).where(congestion_situation: 0)
    @congestion_weekend_woman_16to18_normal = Congestion.where(id: @congestion_weekend_woman_16to18).where(congestion_situation: 1)
    @congestion_weekend_woman_16to18_crowded = Congestion.where(id: @congestion_weekend_woman_16to18).where(congestion_situation: 2)
    @congestion_weekend_woman_16to18_very_crowded = Congestion.where(id: @congestion_weekend_woman_16to18).where(congestion_situation: 3)

    @congestion_weekend_woman_18to20 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 7)
    @congestion_weekend_woman_18to20_empty = Congestion.where(id: @congestion_weekend_woman_18to20).where(congestion_situation: 0)
    @congestion_weekend_woman_18to20_normal = Congestion.where(id: @congestion_weekend_woman_18to20).where(congestion_situation: 1)
    @congestion_weekend_woman_18to20_crowded = Congestion.where(id: @congestion_weekend_woman_18to20).where(congestion_situation: 2)
    @congestion_weekend_woman_18to20_very_crowded = Congestion.where(id: @congestion_weekend_woman_18to20).where(congestion_situation: 3)

    @congestion_weekend_woman_20to22 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 8)
    @congestion_weekend_woman_20to22_empty = Congestion.where(id: @congestion_weekend_woman_20to22).where(congestion_situation: 0)
    @congestion_weekend_woman_20to22_normal = Congestion.where(id: @congestion_weekend_woman_20to22).where(congestion_situation: 1)
    @congestion_weekend_woman_20to22_crowded = Congestion.where(id: @congestion_weekend_woman_20to22).where(congestion_situation: 2)
    @congestion_weekend_woman_20to22_very_crowded = Congestion.where(id: @congestion_weekend_woman_20to22).where(congestion_situation: 3)

    @congestion_weekend_woman_22to24 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 9)
    @congestion_weekend_woman_22to24_empty = Congestion.where(id: @congestion_weekend_woman_22to24).where(congestion_situation: 0)
    @congestion_weekend_woman_22to24_normal = Congestion.where(id: @congestion_weekend_woman_22to24).where(congestion_situation: 1)
    @congestion_weekend_woman_22to24_crowded = Congestion.where(id: @congestion_weekend_woman_22to24).where(congestion_situation: 2)
    @congestion_weekend_woman_22to24_very_crowded = Congestion.where(id: @congestion_weekend_woman_22to24).where(congestion_situation: 3)

    @congestion_weekend_woman_00to02 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 10)
    @congestion_weekend_woman_00to02_empty = Congestion.where(id: @congestion_weekend_woman_00to02).where(congestion_situation: 0)
    @congestion_weekend_woman_00to02_normal = Congestion.where(id: @congestion_weekend_woman_00to02).where(congestion_situation: 1)
    @congestion_weekend_woman_00to02_crowded = Congestion.where(id: @congestion_weekend_woman_00to02).where(congestion_situation: 2)
    @congestion_weekend_woman_00to02_very_crowded = Congestion.where(id: @congestion_weekend_woman_00to02).where(congestion_situation: 3)

    @congestion_weekend_woman_02to04 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 11)
    @congestion_weekend_woman_02to04_empty = Congestion.where(id: @congestion_weekend_woman_02to04).where(congestion_situation: 0)
    @congestion_weekend_woman_02to04_normal = Congestion.where(id: @congestion_weekend_woman_02to04).where(congestion_situation: 1)
    @congestion_weekend_woman_02to04_crowded = Congestion.where(id: @congestion_weekend_woman_02to04).where(congestion_situation: 2)
    @congestion_weekend_woman_02to04_very_crowded = Congestion.where(id: @congestion_weekend_woman_02to04).where(congestion_situation: 3)

    @congestion_weekend_woman_04to06 = Congestion.where(id: @congestion_weekend_woman).where(time_zone: 12)
    @congestion_weekend_woman_04to06_empty = Congestion.where(id: @congestion_weekend_woman_04to06).where(congestion_situation: 0)
    @congestion_weekend_woman_04to06_normal = Congestion.where(id: @congestion_weekend_woman_04to06).where(congestion_situation: 1)
    @congestion_weekend_woman_04to06_crowded = Congestion.where(id: @congestion_weekend_woman_04to06).where(congestion_situation: 2)
    @congestion_weekend_woman_04to06_very_crowded = Congestion.where(id: @congestion_weekend_woman_04to06).where(congestion_situation: 3)



    @congestion_weekend_rest_area_06to08 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 1)
    @congestion_weekend_rest_area_06to08_empty = Congestion.where(id: @congestion_weekend_rest_area_06to08).where(congestion_situation: 0)
    @congestion_weekend_rest_area_06to08_normal = Congestion.where(id: @congestion_weekend_rest_area_06to08).where(congestion_situation: 1)
    @congestion_weekend_rest_area_06to08_crowded = Congestion.where(id: @congestion_weekend_rest_area_06to08).where(congestion_situation: 2)
    @congestion_weekend_rest_area_06to08_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_06to08).where(congestion_situation: 3)

    @congestion_weekend_rest_area_08to10 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 2)
    @congestion_weekend_rest_area_08to10_empty = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 0)
    @congestion_weekend_rest_area_08to10_normal = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 1)
    @congestion_weekend_rest_area_08to10_crowded = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 2)
    @congestion_weekend_rest_area_08to10_very_crowded = Congestion.where(id: @congestion_weekend_08to10_man).where(congestion_situation: 3)

    @congestion_weekend_rest_area_10to12 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 3)
    @congestion_weekend_rest_area_10to12_empty = Congestion.where(id: @congestion_weekend_rest_area_10to12).where(congestion_situation: 0)
    @congestion_weekend_rest_area_10to12_normal = Congestion.where(id: @congestion_weekend_rest_area_10to12).where(congestion_situation: 1)
    @congestion_weekend_rest_area_10to12_crowded = Congestion.where(id: @congestion_weekend_rest_area_10to12).where(congestion_situation: 2)
    @congestion_weekend_rest_area_10to12_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_10to12).where(congestion_situation: 3)

    @congestion_weekend_rest_area_12to14 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 4)
    @congestion_weekend_rest_area_12to14_empty = Congestion.where(id: @congestion_weekend_rest_area_12to14).where(congestion_situation: 0)
    @congestion_weekend_rest_area_12to14_normal = Congestion.where(id: @congestion_weekend_rest_area_12to14).where(congestion_situation: 1)
    @congestion_weekend_rest_area_12to14_crowded = Congestion.where(id: @congestion_weekend_rest_area_12to14).where(congestion_situation: 2)
    @congestion_weekend_rest_area_12to14_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_12to14).where(congestion_situation: 3)

    @congestion_weekend_rest_area_14to16 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 5)
    @congestion_weekend_rest_area_14to16_empty = Congestion.where(id: @congestion_weekend_rest_area_14to16).where(congestion_situation: 0)
    @congestion_weekend_rest_area_14to16_normal = Congestion.where(id: @congestion_weekend_rest_area_14to16).where(congestion_situation: 1)
    @congestion_weekend_rest_area_14to16_crowded = Congestion.where(id: @congestion_weekend_rest_area_14to16).where(congestion_situation: 2)
    @congestion_weekend_rest_area_14to16_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_14to16).where(congestion_situation: 3)

    @congestion_weekend_rest_area_16to18 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 6)
    @congestion_weekend_rest_area_16to18_empty = Congestion.where(id: @congestion_weekend_rest_area_16to18).where(congestion_situation: 0)
    @congestion_weekend_rest_area_16to18_normal = Congestion.where(id: @congestion_weekend_rest_area_16to18).where(congestion_situation: 1)
    @congestion_weekend_rest_area_16to18_crowded = Congestion.where(id: @congestion_weekend_rest_area_16to18).where(congestion_situation: 2)
    @congestion_weekend_rest_area_16to18_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_16to18).where(congestion_situation: 3)

    @congestion_weekend_rest_area_18to20 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 7)
    @congestion_weekend_rest_area_18to20_empty = Congestion.where(id: @congestion_weekend_rest_area_18to20).where(congestion_situation: 0)
    @congestion_weekend_rest_area_18to20_normal = Congestion.where(id: @congestion_weekend_rest_area_18to20).where(congestion_situation: 1)
    @congestion_weekend_rest_area_18to20_crowded = Congestion.where(id: @congestion_weekend_rest_area_18to20).where(congestion_situation: 2)
    @congestion_weekend_rest_area_18to20_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_18to20).where(congestion_situation: 3)

    @congestion_weekend_rest_area_20to22 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 8)
    @congestion_weekend_rest_area_20to22_empty = Congestion.where(id: @congestion_weekend_rest_area_20to22).where(congestion_situation: 0)
    @congestion_weekend_rest_area_20to22_normal = Congestion.where(id: @congestion_weekend_rest_area_20to22).where(congestion_situation: 1)
    @congestion_weekend_rest_area_20to22_crowded = Congestion.where(id: @congestion_weekend_rest_area_20to22).where(congestion_situation: 2)
    @congestion_weekend_rest_area_20to22_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_20to22).where(congestion_situation: 3)

    @congestion_weekend_rest_area_22to24 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 9)
    @congestion_weekend_rest_area_22to24_empty = Congestion.where(id: @congestion_weekend_rest_area_22to24).where(congestion_situation: 0)
    @congestion_weekend_rest_area_22to24_normal = Congestion.where(id: @congestion_weekend_rest_area_22to24).where(congestion_situation: 1)
    @congestion_weekend_rest_area_22to24_crowded = Congestion.where(id: @congestion_weekend_rest_area_22to24).where(congestion_situation: 2)
    @congestion_weekend_rest_area_22to24_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_22to24).where(congestion_situation: 3)

    @congestion_weekend_rest_area_00to02 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 10)
    @congestion_weekend_rest_area_00to02_empty = Congestion.where(id: @congestion_weekend_rest_area_00to02).where(congestion_situation: 0)
    @congestion_weekend_rest_area_00to02_normal = Congestion.where(id: @congestion_weekend_rest_area_00to02).where(congestion_situation: 1)
    @congestion_weekend_rest_area_00to02_crowded = Congestion.where(id: @congestion_weekend_rest_area_00to02).where(congestion_situation: 2)
    @congestion_weekend_rest_area_00to02_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_00to02).where(congestion_situation: 3)

    @congestion_weekend_rest_area_02to04 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 11)
    @congestion_weekend_rest_area_02to04_empty = Congestion.where(id: @congestion_weekend_rest_area_02to04).where(congestion_situation: 0)
    @congestion_weekend_rest_area_02to04_normal = Congestion.where(id: @congestion_weekend_rest_area_02to04).where(congestion_situation: 1)
    @congestion_weekend_rest_area_02to04_crowded = Congestion.where(id: @congestion_weekend_rest_area_02to04).where(congestion_situation: 2)
    @congestion_weekend_rest_area_02to04_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_02to04).where(congestion_situation: 3)

    @congestion_weekend_rest_area_04to06 = Congestion.where(id: @congestion_weekend_rest_area).where(time_zone: 12)
    @congestion_weekend_rest_area_04to06_empty = Congestion.where(id: @congestion_weekend_rest_area_04to06).where(congestion_situation: 0)
    @congestion_weekend_rest_area_04to06_normal = Congestion.where(id: @congestion_weekend_rest_area_04to06).where(congestion_situation: 1)
    @congestion_weekend_rest_area_04to06_crowded = Congestion.where(id: @congestion_weekend_rest_area_04to06).where(congestion_situation: 2)
    @congestion_weekend_rest_area_04to06_very_crowded = Congestion.where(id: @congestion_weekend_rest_area_04to06).where(congestion_situation: 3)



# ここから
    @congestion_weekday_man = Congestion.where(id: @congestion_weekday).where(classification: 0)
    @congestion_weekday_woman = Congestion.where(id: @congestion_weekday).where(classification: 1)
    @congestion_weekday_rest_area = Congestion.where(id: @congestion_weekday).where(classification: 2)

    @congestion_weekday_man_06to08 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 1)
    @congestion_weekday_man_06to08_empty = Congestion.where(id: @congestion_weekday_man_06to08).where(congestion_situation: 0)
    @congestion_weekday_man_06to08_normal = Congestion.where(id: @congestion_weekday_man_06to08).where(congestion_situation: 1)
    @congestion_weekday_man_06to08_crowded = Congestion.where(id: @congestion_weekday_man_06to08).where(congestion_situation: 2)
    @congestion_weekday_man_06to08_very_crowded = Congestion.where(id: @congestion_weekday_man_06to08).where(congestion_situation: 3)

    @congestion_weekday_man_08to10 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 2)
    @congestion_weekday_man_08to10_empty = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 0)
    @congestion_weekday_man_08to10_normal = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 1)
    @congestion_weekday_man_08to10_crowded = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 2)
    @congestion_weekday_man_08to10_very_crowded = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 3)

    @congestion_weekday_man_10to12 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 3)
    @congestion_weekday_man_10to12_empty = Congestion.where(id: @congestion_weekday_man_10to12).where(congestion_situation: 0)
    @congestion_weekday_man_10to12_normal = Congestion.where(id: @congestion_weekday_man_10to12).where(congestion_situation: 1)
    @congestion_weekday_man_10to12_crowded = Congestion.where(id: @congestion_weekday_man_10to12).where(congestion_situation: 2)
    @congestion_weekday_man_10to12_very_crowded = Congestion.where(id: @congestion_weekday_man_10to12).where(congestion_situation: 3)

    @congestion_weekday_man_12to14 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 4)
    @congestion_weekday_man_12to14_empty = Congestion.where(id: @congestion_weekday_man_12to14).where(congestion_situation: 0)
    @congestion_weekday_man_12to14_normal = Congestion.where(id: @congestion_weekday_man_12to14).where(congestion_situation: 1)
    @congestion_weekday_man_12to14_crowded = Congestion.where(id: @congestion_weekday_man_12to14).where(congestion_situation: 2)
    @congestion_weekday_man_12to14_very_crowded = Congestion.where(id: @congestion_weekday_man_12to14).where(congestion_situation: 3)

    @congestion_weekday_man_14to16 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 5)
    @congestion_weekday_man_14to16_empty = Congestion.where(id: @congestion_weekday_man_14to16).where(congestion_situation: 0)
    @congestion_weekday_man_14to16_normal = Congestion.where(id: @congestion_weekday_man_14to16).where(congestion_situation: 1)
    @congestion_weekday_man_14to16_crowded = Congestion.where(id: @congestion_weekday_man_14to16).where(congestion_situation: 2)
    @congestion_weekday_man_14to16_very_crowded = Congestion.where(id: @congestion_weekday_man_14to16).where(congestion_situation: 3)

    @congestion_weekday_man_16to18 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 6)
    @congestion_weekday_man_16to18_empty = Congestion.where(id: @congestion_weekday_man_16to18).where(congestion_situation: 0)
    @congestion_weekday_man_16to18_normal = Congestion.where(id: @congestion_weekday_man_16to18).where(congestion_situation: 1)
    @congestion_weekday_man_16to18_crowded = Congestion.where(id: @congestion_weekday_man_16to18).where(congestion_situation: 2)
    @congestion_weekday_man_16to18_very_crowded = Congestion.where(id: @congestion_weekday_man_16to18).where(congestion_situation: 3)

    @congestion_weekday_man_18to20 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 7)
    @congestion_weekday_man_18to20_empty = Congestion.where(id: @congestion_weekday_man_18to20).where(congestion_situation: 0)
    @congestion_weekday_man_18to20_normal = Congestion.where(id: @congestion_weekday_man_18to20).where(congestion_situation: 1)
    @congestion_weekday_man_18to20_crowded = Congestion.where(id: @congestion_weekday_man_18to20).where(congestion_situation: 2)
    @congestion_weekday_man_18to20_very_crowded = Congestion.where(id: @congestion_weekday_man_18to20).where(congestion_situation: 3)

    @congestion_weekday_man_20to22 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 8)
    @congestion_weekday_man_20to22_empty = Congestion.where(id: @congestion_weekday_man_20to22).where(congestion_situation: 0)
    @congestion_weekday_man_20to22_normal = Congestion.where(id: @congestion_weekday_man_20to22).where(congestion_situation: 1)
    @congestion_weekday_man_20to22_crowded = Congestion.where(id: @congestion_weekday_man_20to22).where(congestion_situation: 2)
    @congestion_weekday_man_20to22_very_crowded = Congestion.where(id: @congestion_weekday_man_20to22).where(congestion_situation: 3)

    @congestion_weekday_man_22to24 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 9)
    @congestion_weekday_man_22to24_empty = Congestion.where(id: @congestion_weekday_man_22to24).where(congestion_situation: 0)
    @congestion_weekday_man_22to24_normal = Congestion.where(id: @congestion_weekday_man_22to24).where(congestion_situation: 1)
    @congestion_weekday_man_22to24_crowded = Congestion.where(id: @congestion_weekday_man_22to24).where(congestion_situation: 2)
    @congestion_weekday_man_22to24_very_crowded = Congestion.where(id: @congestion_weekday_man_22to24).where(congestion_situation: 3)

    @congestion_weekday_man_00to02 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 10)
    @congestion_weekday_man_00to02_empty = Congestion.where(id: @congestion_weekday_man_00to02).where(congestion_situation: 0)
    @congestion_weekday_man_00to02_normal = Congestion.where(id: @congestion_weekday_man_00to02).where(congestion_situation: 1)
    @congestion_weekday_man_00to02_crowded = Congestion.where(id: @congestion_weekday_man_00to02).where(congestion_situation: 2)
    @congestion_weekday_man_00to02_very_crowded = Congestion.where(id: @congestion_weekday_man_00to02).where(congestion_situation: 3)

    @congestion_weekday_man_02to04 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 11)
    @congestion_weekday_man_02to04_empty = Congestion.where(id: @congestion_weekday_man_02to04).where(congestion_situation: 0)
    @congestion_weekday_man_02to04_normal = Congestion.where(id: @congestion_weekday_man_02to04).where(congestion_situation: 1)
    @congestion_weekday_man_02to04_crowded = Congestion.where(id: @congestion_weekday_man_02to04).where(congestion_situation: 2)
    @congestion_weekday_man_02to04_very_crowded = Congestion.where(id: @congestion_weekday_man_02to04).where(congestion_situation: 3)

    @congestion_weekday_man_04to06 = Congestion.where(id: @congestion_weekday_man).where(time_zone: 12)
    @congestion_weekday_man_04to06_empty = Congestion.where(id: @congestion_weekday_man_04to06).where(congestion_situation: 0)
    @congestion_weekday_man_04to06_normal = Congestion.where(id: @congestion_weekday_man_04to06).where(congestion_situation: 1)
    @congestion_weekday_man_04to06_crowded = Congestion.where(id: @congestion_weekday_man_04to06).where(congestion_situation: 2)
    @congestion_weekday_man_04to06_very_crowded = Congestion.where(id: @congestion_weekday_man_04to06).where(congestion_situation: 3)



    @congestion_weekday_woman_06to08 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 1)
    @congestion_weekday_woman_06to08_empty = Congestion.where(id: @congestion_weekday_woman_06to08).where(congestion_situation: 0)
    @congestion_weekday_woman_06to08_normal = Congestion.where(id: @congestion_weekday_woman_06to08).where(congestion_situation: 1)
    @congestion_weekday_woman_06to08_crowded = Congestion.where(id: @congestion_weekday_woman_06to08).where(congestion_situation: 2)
    @congestion_weekday_woman_06to08_very_crowded = Congestion.where(id: @congestion_weekday_woman_06to08).where(congestion_situation: 3)

    @congestion_weekday_woman_08to10 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 2)
    @congestion_weekday_woman_08to10_empty = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 0)
    @congestion_weekday_woman_08to10_normal = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 1)
    @congestion_weekday_woman_08to10_crowded = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 2)
    @congestion_weekday_woman_08to10_very_crowded = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 3)

    @congestion_weekday_woman_10to12 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 3)
    @congestion_weekday_woman_10to12_empty = Congestion.where(id: @congestion_weekday_woman_10to12).where(congestion_situation: 0)
    @congestion_weekday_woman_10to12_normal = Congestion.where(id: @congestion_weekday_woman_10to12).where(congestion_situation: 1)
    @congestion_weekday_woman_10to12_crowded = Congestion.where(id: @congestion_weekday_woman_10to12).where(congestion_situation: 2)
    @congestion_weekday_woman_10to12_very_crowded = Congestion.where(id: @congestion_weekday_woman_10to12).where(congestion_situation: 3)

    @congestion_weekday_woman_12to14 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 4)
    @congestion_weekday_woman_12to14_empty = Congestion.where(id: @congestion_weekday_woman_12to14).where(congestion_situation: 0)
    @congestion_weekday_woman_12to14_normal = Congestion.where(id: @congestion_weekday_woman_12to14).where(congestion_situation: 1)
    @congestion_weekday_woman_12to14_crowded = Congestion.where(id: @congestion_weekday_woman_12to14).where(congestion_situation: 2)
    @congestion_weekday_woman_12to14_very_crowded = Congestion.where(id: @congestion_weekday_woman_12to14).where(congestion_situation: 3)

    @congestion_weekday_woman_14to16 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 5)
    @congestion_weekday_woman_14to16_empty = Congestion.where(id: @congestion_weekday_woman_14to16).where(congestion_situation: 0)
    @congestion_weekday_woman_14to16_normal = Congestion.where(id: @congestion_weekday_woman_14to16).where(congestion_situation: 1)
    @congestion_weekday_woman_14to16_crowded = Congestion.where(id: @congestion_weekday_woman_14to16).where(congestion_situation: 2)
    @congestion_weekday_woman_14to16_very_crowded = Congestion.where(id: @congestion_weekday_woman_14to16).where(congestion_situation: 3)

    @congestion_weekday_woman_16to18 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 6)
    @congestion_weekday_woman_16to18_empty = Congestion.where(id: @congestion_weekday_woman_16to18).where(congestion_situation: 0)
    @congestion_weekday_woman_16to18_normal = Congestion.where(id: @congestion_weekday_woman_16to18).where(congestion_situation: 1)
    @congestion_weekday_woman_16to18_crowded = Congestion.where(id: @congestion_weekday_woman_16to18).where(congestion_situation: 2)
    @congestion_weekday_woman_16to18_very_crowded = Congestion.where(id: @congestion_weekday_woman_16to18).where(congestion_situation: 3)

    @congestion_weekday_woman_18to20 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 7)
    @congestion_weekday_woman_18to20_empty = Congestion.where(id: @congestion_weekday_woman_18to20).where(congestion_situation: 0)
    @congestion_weekday_woman_18to20_normal = Congestion.where(id: @congestion_weekday_woman_18to20).where(congestion_situation: 1)
    @congestion_weekday_woman_18to20_crowded = Congestion.where(id: @congestion_weekday_woman_18to20).where(congestion_situation: 2)
    @congestion_weekday_woman_18to20_very_crowded = Congestion.where(id: @congestion_weekday_woman_18to20).where(congestion_situation: 3)

    @congestion_weekday_woman_20to22 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 8)
    @congestion_weekday_woman_20to22_empty = Congestion.where(id: @congestion_weekday_woman_20to22).where(congestion_situation: 0)
    @congestion_weekday_woman_20to22_normal = Congestion.where(id: @congestion_weekday_woman_20to22).where(congestion_situation: 1)
    @congestion_weekday_woman_20to22_crowded = Congestion.where(id: @congestion_weekday_woman_20to22).where(congestion_situation: 2)
    @congestion_weekday_woman_20to22_very_crowded = Congestion.where(id: @congestion_weekday_woman_20to22).where(congestion_situation: 3)

    @congestion_weekday_woman_22to24 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 9)
    @congestion_weekday_woman_22to24_empty = Congestion.where(id: @congestion_weekday_woman_22to24).where(congestion_situation: 0)
    @congestion_weekday_woman_22to24_normal = Congestion.where(id: @congestion_weekday_woman_22to24).where(congestion_situation: 1)
    @congestion_weekday_woman_22to24_crowded = Congestion.where(id: @congestion_weekday_woman_22to24).where(congestion_situation: 2)
    @congestion_weekday_woman_22to24_very_crowded = Congestion.where(id: @congestion_weekday_woman_22to24).where(congestion_situation: 3)

    @congestion_weekday_woman_00to02 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 10)
    @congestion_weekday_woman_00to02_empty = Congestion.where(id: @congestion_weekday_woman_00to02).where(congestion_situation: 0)
    @congestion_weekday_woman_00to02_normal = Congestion.where(id: @congestion_weekday_woman_00to02).where(congestion_situation: 1)
    @congestion_weekday_woman_00to02_crowded = Congestion.where(id: @congestion_weekday_woman_00to02).where(congestion_situation: 2)
    @congestion_weekday_woman_00to02_very_crowded = Congestion.where(id: @congestion_weekday_woman_00to02).where(congestion_situation: 3)

    @congestion_weekday_woman_02to04 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 11)
    @congestion_weekday_woman_02to04_empty = Congestion.where(id: @congestion_weekday_woman_02to04).where(congestion_situation: 0)
    @congestion_weekday_woman_02to04_normal = Congestion.where(id: @congestion_weekday_woman_02to04).where(congestion_situation: 1)
    @congestion_weekday_woman_02to04_crowded = Congestion.where(id: @congestion_weekday_woman_02to04).where(congestion_situation: 2)
    @congestion_weekday_woman_02to04_very_crowded = Congestion.where(id: @congestion_weekday_woman_02to04).where(congestion_situation: 3)

    @congestion_weekday_woman_04to06 = Congestion.where(id: @congestion_weekday_woman).where(time_zone: 12)
    @congestion_weekday_woman_04to06_empty = Congestion.where(id: @congestion_weekday_woman_04to06).where(congestion_situation: 0)
    @congestion_weekday_woman_04to06_normal = Congestion.where(id: @congestion_weekday_woman_04to06).where(congestion_situation: 1)
    @congestion_weekday_woman_04to06_crowded = Congestion.where(id: @congestion_weekday_woman_04to06).where(congestion_situation: 2)
    @congestion_weekday_woman_04to06_very_crowded = Congestion.where(id: @congestion_weekday_woman_04to06).where(congestion_situation: 3)



    @congestion_weekday_rest_area_06to08 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 1)
    @congestion_weekday_rest_area_06to08_empty = Congestion.where(id: @congestion_weekday_rest_area_06to08).where(congestion_situation: 0)
    @congestion_weekday_rest_area_06to08_normal = Congestion.where(id: @congestion_weekday_rest_area_06to08).where(congestion_situation: 1)
    @congestion_weekday_rest_area_06to08_crowded = Congestion.where(id: @congestion_weekday_rest_area_06to08).where(congestion_situation: 2)
    @congestion_weekday_rest_area_06to08_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_06to08).where(congestion_situation: 3)

    @congestion_weekday_rest_area_08to10 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 2)
    @congestion_weekday_rest_area_08to10_empty = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 0)
    @congestion_weekday_rest_area_08to10_normal = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 1)
    @congestion_weekday_rest_area_08to10_crowded = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 2)
    @congestion_weekday_rest_area_08to10_very_crowded = Congestion.where(id: @congestion_weekday_08to10_man).where(congestion_situation: 3)

    @congestion_weekday_rest_area_10to12 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 3)
    @congestion_weekday_rest_area_10to12_empty = Congestion.where(id: @congestion_weekday_rest_area_10to12).where(congestion_situation: 0)
    @congestion_weekday_rest_area_10to12_normal = Congestion.where(id: @congestion_weekday_rest_area_10to12).where(congestion_situation: 1)
    @congestion_weekday_rest_area_10to12_crowded = Congestion.where(id: @congestion_weekday_rest_area_10to12).where(congestion_situation: 2)
    @congestion_weekday_rest_area_10to12_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_10to12).where(congestion_situation: 3)

    @congestion_weekday_rest_area_12to14 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 4)
    @congestion_weekday_rest_area_12to14_empty = Congestion.where(id: @congestion_weekday_rest_area_12to14).where(congestion_situation: 0)
    @congestion_weekday_rest_area_12to14_normal = Congestion.where(id: @congestion_weekday_rest_area_12to14).where(congestion_situation: 1)
    @congestion_weekday_rest_area_12to14_crowded = Congestion.where(id: @congestion_weekday_rest_area_12to14).where(congestion_situation: 2)
    @congestion_weekday_rest_area_12to14_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_12to14).where(congestion_situation: 3)

    @congestion_weekday_rest_area_14to16 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 5)
    @congestion_weekday_rest_area_14to16_empty = Congestion.where(id: @congestion_weekday_rest_area_14to16).where(congestion_situation: 0)
    @congestion_weekday_rest_area_14to16_normal = Congestion.where(id: @congestion_weekday_rest_area_14to16).where(congestion_situation: 1)
    @congestion_weekday_rest_area_14to16_crowded = Congestion.where(id: @congestion_weekday_rest_area_14to16).where(congestion_situation: 2)
    @congestion_weekday_rest_area_14to16_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_14to16).where(congestion_situation: 3)

    @congestion_weekday_rest_area_16to18 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 6)
    @congestion_weekday_rest_area_16to18_empty = Congestion.where(id: @congestion_weekday_rest_area_16to18).where(congestion_situation: 0)
    @congestion_weekday_rest_area_16to18_normal = Congestion.where(id: @congestion_weekday_rest_area_16to18).where(congestion_situation: 1)
    @congestion_weekday_rest_area_16to18_crowded = Congestion.where(id: @congestion_weekday_rest_area_16to18).where(congestion_situation: 2)
    @congestion_weekday_rest_area_16to18_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_16to18).where(congestion_situation: 3)

    @congestion_weekday_rest_area_18to20 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 7)
    @congestion_weekday_rest_area_18to20_empty = Congestion.where(id: @congestion_weekday_rest_area_18to20).where(congestion_situation: 0)
    @congestion_weekday_rest_area_18to20_normal = Congestion.where(id: @congestion_weekday_rest_area_18to20).where(congestion_situation: 1)
    @congestion_weekday_rest_area_18to20_crowded = Congestion.where(id: @congestion_weekday_rest_area_18to20).where(congestion_situation: 2)
    @congestion_weekday_rest_area_18to20_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_18to20).where(congestion_situation: 3)

    @congestion_weekday_rest_area_20to22 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 8)
    @congestion_weekday_rest_area_20to22_empty = Congestion.where(id: @congestion_weekday_rest_area_20to22).where(congestion_situation: 0)
    @congestion_weekday_rest_area_20to22_normal = Congestion.where(id: @congestion_weekday_rest_area_20to22).where(congestion_situation: 1)
    @congestion_weekday_rest_area_20to22_crowded = Congestion.where(id: @congestion_weekday_rest_area_20to22).where(congestion_situation: 2)
    @congestion_weekday_rest_area_20to22_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_20to22).where(congestion_situation: 3)

    @congestion_weekday_rest_area_22to24 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 9)
    @congestion_weekday_rest_area_22to24_empty = Congestion.where(id: @congestion_weekday_rest_area_22to24).where(congestion_situation: 0)
    @congestion_weekday_rest_area_22to24_normal = Congestion.where(id: @congestion_weekday_rest_area_22to24).where(congestion_situation: 1)
    @congestion_weekday_rest_area_22to24_crowded = Congestion.where(id: @congestion_weekday_rest_area_22to24).where(congestion_situation: 2)
    @congestion_weekday_rest_area_22to24_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_22to24).where(congestion_situation: 3)

    @congestion_weekday_rest_area_00to02 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 10)
    @congestion_weekday_rest_area_00to02_empty = Congestion.where(id: @congestion_weekday_rest_area_00to02).where(congestion_situation: 0)
    @congestion_weekday_rest_area_00to02_normal = Congestion.where(id: @congestion_weekday_rest_area_00to02).where(congestion_situation: 1)
    @congestion_weekday_rest_area_00to02_crowded = Congestion.where(id: @congestion_weekday_rest_area_00to02).where(congestion_situation: 2)
    @congestion_weekday_rest_area_00to02_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_00to02).where(congestion_situation: 3)

    @congestion_weekday_rest_area_02to04 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 11)
    @congestion_weekday_rest_area_02to04_empty = Congestion.where(id: @congestion_weekday_rest_area_02to04).where(congestion_situation: 0)
    @congestion_weekday_rest_area_02to04_normal = Congestion.where(id: @congestion_weekday_rest_area_02to04).where(congestion_situation: 1)
    @congestion_weekday_rest_area_02to04_crowded = Congestion.where(id: @congestion_weekday_rest_area_02to04).where(congestion_situation: 2)
    @congestion_weekday_rest_area_02to04_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_02to04).where(congestion_situation: 3)

    @congestion_weekday_rest_area_04to06 = Congestion.where(id: @congestion_weekday_rest_area).where(time_zone: 12)
    @congestion_weekday_rest_area_04to06_empty = Congestion.where(id: @congestion_weekday_rest_area_04to06).where(congestion_situation: 0)
    @congestion_weekday_rest_area_04to06_normal = Congestion.where(id: @congestion_weekday_rest_area_04to06).where(congestion_situation: 1)
    @congestion_weekday_rest_area_04to06_crowded = Congestion.where(id: @congestion_weekday_rest_area_04to06).where(congestion_situation: 2)
    @congestion_weekday_rest_area_04to06_very_crowded = Congestion.where(id: @congestion_weekday_rest_area_04to06).where(congestion_situation: 3)
  end

  def edit
    @bathhouse = Bathhouse.find(params[:id])
    @gender = Gender.where(bathhouse_id: @bathhouse.id)
    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')

    @bathhouse_gender_man = @gender.find_by(sex: 0)
    @bathhouse_gender_woman = @gender.find_by(sex: 1)
    @bathhouse_gender_be_common = @gender.find_by(sex: 2)

    @index = 0
  end

  def edit_image
    @bathhouse = Bathhouse.find(params[:id])
    @bathhouse.attributes = bathhouse_params
    @gender_man_fetures = Feature.find(params[:bathhouse][:gender_man_attributes][:feature_ids].compact_blank)
    @gender_woman_features = Feature.find(params[:bathhouse][:gender_woman_attributes][:feature_ids].compact_blank)
    @gender_be_common_fetures = Feature.find(params[:bathhouse][:gender_be_common_attributes][:feature_ids].compact_blank)
    #byebug
  end

  def edit_confirm
    @confirm = Confirm.new()
    @confirm.bathhouse_image_main = params[:bathhouse][:bathhouse_image_main]
    @confirm.bathhouse_image_sub1 = params[:bathhouse][:bathhouse_image_sub1]
    @confirm.bathhouse_image_sub2 = params[:bathhouse][:bathhouse_image_sub2]
    @confirm.bathhouse_image_sub3 = params[:bathhouse][:bathhouse_image_sub3]
    @confirm.bathhouse_image_sub4 = params[:bathhouse][:bathhouse_image_sub4]
    @confirm.bathhouse_image_sub5 = params[:bathhouse][:bathhouse_image_sub5]
    @confirm.save

    #@gender = gender_men_attributes.all
    @bathhouse = Bathhouse.find(params[:id])
    @bathhouse.attributes = bathhouse_params_2

    #@gender_man_fetures = Feature.find(params[:bathhouse][:gender_man_attributes][:feature_ids].compact_blank)
    man_feature_ids =  params[:bathhouse][:gender_man_feature_ids].split(" ").map {|id| id.to_i}
    @man_feature =  Feature.where(id: man_feature_ids)
    woman_feature_ids =  params[:bathhouse][:gender_woman_feature_ids].split(" ").map {|id| id.to_i}
    @woman_feature =  Feature.where(id: woman_feature_ids)
    be_common_ids =  params[:bathhouse][:gender_be_common_feature_ids].split(" ").map {|id| id.to_i}
    @be_common =  Feature.where(id: be_common_ids)

    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')

    @gender_man_bath_facilities = @man_feature.where(category: 'bath_facilities')
    @gender_man_sauna = @man_feature.where(category: 'sauna')


    #@gender_woman_features = Feature.find(params[:bathhouse][:gender_woman_attributes][:feature_ids].compact_blank)
    @gender_woman_bath_facilities = @woman_feature.where(category: 'bath_facilities')
    @gender_woman_sauna = @woman_feature.where(category: 'sauna')

    #@gender_be_common_fetures = Feature.find(params[:bathhouse][:gender_be_common_attributes][:feature_ids].compact_blank)
    @other = @be_common.where(category: 'other')
    @building_facilities = @be_common.where(category: 'building_facilities')

  end

  def update
    @bathhouse = Bathhouse.find(params[:id])
    @confirm = Confirm.find(confirm_params[:confirm_id])
    @bathhouse.update(bathhouse_params_2)
    @confirm.destroy

    @gender = Gender.where(bathhouse_id: @bathhouse.id)
    @bathhouse_gender_man = @gender.find_by(sex: 0)
    @bathhouse_gender_woman = @gender.find_by(sex: 1)
    @bathhouse_gender_be_common = @gender.find_by(sex: 2)

    gender_man_category = Category.where(gender_id: @bathhouse_gender_man.id)
    gender_woman_category= Category.where(gender_id: @bathhouse_gender_woman.id)
    gender_be_common_category = Category.where(gender_id: @bathhouse_gender_be_common.id)

    gender_man_category.destroy_all
    gender_woman_category.destroy_all
    gender_be_common_category.destroy_all

    man_feature_ids =  params[:bathhouse][:gender_man_feature_ids].split(" ").map {|id| id.to_i}
    @man_feature =  Feature.where(id: man_feature_ids)
    @man_feature.each do |man_feature|
      @bathhouse_gender_man_category = Category.new
      @bathhouse_gender_man_category.gender_id = @bathhouse_gender_man.id
      @bathhouse_gender_man_category.feature_id = man_feature.id
      @bathhouse_gender_man_category.save
    end

    woman_feature_ids =  params[:bathhouse][:gender_woman_feature_ids].split(" ").map {|id| id.to_i}
    @woman_feature =  Feature.where(id: woman_feature_ids)
    @woman_feature.each do |woman_feature|
      @bathhouse_gender_woman_category = Category.new
      @bathhouse_gender_woman_category.gender_id = @bathhouse_gender_woman.id
      @bathhouse_gender_woman_category.feature_id = woman_feature.id
      @bathhouse_gender_woman_category.save
    end

    be_common_ids =  params[:bathhouse][:gender_be_common_feature_ids].split(" ").map {|id| id.to_i}
    @be_common =  Feature.where(id: be_common_ids)
    @be_common.each do |be_common_feature|
      @bathhouse_be_common_category = Category.new
      @bathhouse_be_common_category.gender_id = @bathhouse_be_common.id
      @bathhouse_be_common_category.feature_id = be_common_feature.id
      @bathhouse_be_common_category.save
    end
    redirect_to bathhouse_path(@bathhouse.id)

  end

  def destroy_image
    @bathhouse = Bathhouse.find(params[:id])
  end

  def review_new
    @bathhouse = Bathhouse.find(params[:id])
    @review = Review.new
  end

  def review
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Bathhouse.ransack(params[:q])
  end

  def set_bathhouse
    @bathhouse = Bathhouse.find(params[:id])
  end

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
      :bathhouse_image_main,
      :bathhouse_image_sub1,
      :bathhouse_image_sub2,
      :bathhouse_image_sub3,
      :bathhouse_image_sub4,
      :bathhouse_image_sub5,

#      gender_man_attributes: [:feature_ids],
#      gender_woman_attributes: [:feature_ids],
#      gender_be_common_attributes: [:feature_ids]
      )
  end

  def confirm_params
    params.require(:bathhouse).permit(:confirm_id)
  end

  def search_params
    params.require(:bathhouse).permit(:confirm_id)
  end


end
