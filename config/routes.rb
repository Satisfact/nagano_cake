Rails.application.routes.draw do
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end