class CustomersController < ApplicationController
  #before_action :authenticate_costmer!
  def show

  end

  def edit

  end

  def update

  end



  # ユーザーの退会（論理削除）=> "物理削除"ではないためupdateを使用している。
  def destroy
    #is_deletedカラムにフラグを立てる(defaultはfalse)

    #ログアウトさせる

  end

 private
  def
  end

  end
end
