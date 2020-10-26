class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer =  current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
     redirect_to customers_path, notice: "顧客情報編集しました"
    else
     render "edit"
    end
  end
  #退会機能
  #ユーザー情報を見つける
  def unsubscribe
    @customer = current_customer
  end
  
  def withdraw
    @customer = current_customer
    #登録情報をfalseに変更
    @customer.update(is_deleted: false)
    #sessionIDのリセットを行う
    reset_session
    redirect_to root_path
  end

 private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
