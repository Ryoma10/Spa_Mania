Rails.application.routes.draw do
  # 顧客用
  # URL //sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  post 'users/guest_sign_in', to: 'public/users#guest_sign_in'

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  scope module: :public do
    root 'homes#top'
    get 'homes/about', as: 'about'

    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get :stats
        get :favorite_bathhouses
        get :follow
        get :follower
        get :confirm
      end
    end

    resources :notices, only: [:index]

    resources :news, only: [:index, :show]

    resources :bathhouses, only: [:new, :create, :index, :show, :edit, :update] do
      member do
        get :reviews_index
        get :congestion_situation
        get :edit_image
        post :edit_confirm
        resources :review, only: [:show]
        get :destroy_image
        get :review_new
      end
      collection do
        get :confirm
        get :image
        post :create_confirm
      end
    end

    resources :comments, only: [:create, :destroy]

    resources :reports, only: [:new, :create]

    resources :reviews, only: [:index, :create, :destroy]
  end

  namespace :admin do
    root 'homes#index'

    resources :categories, only: [:index]

    resources :features, only: [:index, :create, :destroy]

    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get :stats
        get :favorite_bathhouses
        get :follow
        get :follower
        get :confirm
        get :warning_new
        get :warnings
      end
    end

    resources :warnings, only: [:create]

    resources :reports, only: [:index, :show]

    resources :news, only: [:new, :index, :show, :edit, :destroy]

    resources :bathhouses, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :reviews_index
        get :congestion_situation
        get :edit_image
        get :edit_confirm
        resources :destroy_image, only: [:destroy]
        resources :review, only: [:show]
      end
    end

    resources :reviews, only: [:index, :destroy]
  end


end