Rails.application.routes.draw do

  namespace :public do
    get 'managements/index'
  end
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
    resources :customers, only: [:index, :show, :edit, :update]
  end


  scope module: :public do
    root to: 'homes#top'
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    get 'homes/about'
    get 'managements', to: 'managements#index'
    get 'customers/comfirm_withdraw'
    patch 'customers/withdraw'
    get "search", to: "searches#search"
    resources :customers, only: [:show,:index, :edit, :update]
    resources :oshi_logs, only: [:show, :index, :edit, :create, :update, :destroy] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :schedules, only: [:show, :edit, :create, :update, :destroy]
    resources :expenses, only: [:show, :edit, :create, :update, :destroy]
  end
end
