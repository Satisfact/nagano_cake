Rails.application.routes.draw do


  #管理者用ログインルート
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }
  get 'admins' => 'admins/homes#top'
  #下記都度追加編集　管理者用
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:delete]
  end

  #顧客側
  devise_for :customers
  resources :cart_items, only: [:create, :show, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:top, :index, :show]
  root 'items#top'
  get 'homes/about' => 'homes#about'
  get 'edit' => 'customers#edit'
end