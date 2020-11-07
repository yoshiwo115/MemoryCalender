Rails.application.routes.draw do

  #トップページ
  root 'events#index'
  
  resources :events

  #一覧画面いらないからresource
  resource :user, only: [:new, :create, :show]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
 
end
