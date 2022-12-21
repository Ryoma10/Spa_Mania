class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @review = Review.where(user_id: @user.id).reverse_order.page params[:page]
  end

  def stats
  end

  def favourite_review
    @user = User.find(params[:id])
    @favourites = Favourite.where(user_id: @user.id)
    @review = Review.where(id: @favourites.pluck(:review_id)).reverse_order.page params[:page]
  end

  def favourite_bathhouses
    @user = User.find(params[:id])
    @favourite_bathhouses = FavouriteBathhouse.where(user_id: @user.id)
    @bathhouse = Bathhouse.where(id: @favourite_bathhouses.pluck(:bathhouse_id)).reverse_order.page params[:page]
  end

  def follow
  end

  def follower
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
  end

  def confirm
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64(6)
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, success: 'ゲストユーザーとしてログインしました。'
  end
end
