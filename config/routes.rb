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
    resources :orders, except: [:new,:create,:edit]
  end

  #顧客側
  devise_for :customers, controllers:{
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  #カートアイテム
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete '/cart_items' => 'cart_items#destroy_all', as: :cart_delete
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #顧客情報（マイページ）
  resources :customers, only: [:show, :edit]
  #配送先
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  #itemsの中にordersを入れる
  resources :items, only: [:top, :index, :show] do
    resources :orders, only: [:new, :index, :create, :show]
    post 'orders/confirm' => 'orders#confirm' #注文確認
    get 'orders/complete' => 'orders/complete' #注文完了
  end

  root 'items#top'
  get 'homes/about' => 'homes#about'
end


  #注文関連ビュー確認用
  #get 'orders/show' => 'orders#show'

#顧客用
  #get 'orders/new'　新規注文
  #get 'orders/create'　注文作成
  #get 'orders/confirm'　注文確認
  #get 'orders/complete'　注文完了
  #get 'orders/index'　注文履歴一覧
  #get 'orders/show'　注文履歴


#管理者用
  #get 'admins/orders/index'　注文一覧
  #get 'admins/orders/show　注文詳細
  #patch 'admins/orders/update'　注文更新
#制作ステータス変更のコントローラーもいる

