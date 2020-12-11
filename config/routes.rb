Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/new'
  get 'comments/index'
  get 'comments/show'
  get 'relationships/create'
  get 'relationships/destroy'
  root 'tweets#index'
  devise_for :users

  # ================ここをネスト(入れ子)した形に変更
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end
  #======================================

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.
end
