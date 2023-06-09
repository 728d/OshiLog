Rails.application.routes.draw do

# 会員用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
    resources :sessions, only: [:new, :create, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end


  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    get 'customers/comfirm_withdraw'
    patch 'customers/withdraw'
    resources :customers, only: [:show,:index, :edit, :update]
    resources :oshi_logs, only: [:index, :edit, :create, :update, :destroy]
    resources :schedules, only: [:show, :edit, :create, :update, :destroy]
    resources :expenses, only: [:show, :edit, :create, :update, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
