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
  end

  def index
    @bathhouses = Bathhouse.where(complete: true)
  end

  def reviews_index
    @bathhouse = Bathhouse.find(params[:id])
    @review = Review.where(bathhouse_id: params[:id])
  end

  def congestion_situation
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

end
