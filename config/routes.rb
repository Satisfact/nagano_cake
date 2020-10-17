Rails.application.routes.draw do
  devise_for :customers
  resources :cart_items, only: [:create, :show, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroy2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
