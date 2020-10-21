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




  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  
  #itemsの中にordersを入れる
  resources :items, only: [:top, :index, :show] do
    resources :orders, only: [:new, :index, :create, :show]
    post 'orders/confirm' => 'orders#confirm' #注文確認
    get 'orders/complete' => 'orders/complete' #注文完了
  end
  
  root 'items#top'
  get 'homes/about' => 'homes#about'

  get 'edit' => 'customers#edit'


end

#管理者用
  #get 'admins/orders/index'　注文一覧
  #get 'admins/orders/show　注文詳細
  #patch 'admins/orders/update'　注文更新
#制作ステータス変更のコントローラーもいる

