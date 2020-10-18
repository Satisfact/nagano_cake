Rails.application.routes.draw do

  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }
  get 'admins' => 'admins/homes#top'
  #下記都度
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :customers
  resources :cart_items, only: [:create, :show, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
