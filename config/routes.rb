Rails.application.routes.draw do

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  #下記都度
  namespace :admins do
    get '/', :to => 'homes#top'
    resources :customers, only: [:index, :show, :edit]
  end

  devise_for :customers
  resources :cart_items, only: [:create, :show, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
