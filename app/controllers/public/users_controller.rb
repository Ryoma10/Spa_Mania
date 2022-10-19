class Public::UsersController < ApplicationController
  def show
  end

  def stats
  end

  def favorite_bathhouses
  end

  def follow
  end

  def follower
  end

  def edit
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
