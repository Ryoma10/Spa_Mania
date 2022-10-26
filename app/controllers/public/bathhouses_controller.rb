class Public::BathhousesController < ApplicationController
  def confirm
  end

  def new
    @bathhouse = Bathhouse.new
    @bath_facilities = Feature.where(category: 'bath_facilities')
    @sauna = Feature.where(category: 'sauna')
    @other = Feature.where(category: 'other')
    @building_facilities = Feature.where(category: 'building_facilities')
  end

  def image
  end

  def create_confirm
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
end
