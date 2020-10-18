Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'show' => 'items#show'
 get 'edit' => 'items#edit'
 get 'new' => 'items#new'
 get 'index' => 'items#index'
 get 'top' => 'homes#top'
 get 'home/about' => 'homes#about', as: 'about'
end
