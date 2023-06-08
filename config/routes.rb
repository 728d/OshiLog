Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'expenses/show'
    get 'expenses/edit'
  end
  namespace :public do
    get 'schedules/edit'
    get 'schedules/show'
  end
  namespace :public do
    get 'oshi_logs/index'
    get 'oshi_logs/edit'
    get 'oshi_logs/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/index'
    get 'customers/comfirm_withdraw'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
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
end
