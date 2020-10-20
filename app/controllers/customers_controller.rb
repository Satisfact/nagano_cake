class CustomersController < ApplicationController
<<<<<<< HEAD
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

=======
 # before_action :authenticate_customer!

  def edit
   # @customer = Customer.find(current_customer.id)
  end

  def update
  end

  def show
    #@customer = Customer.find(current_customer.id)
  end

  def delete
  end

  def delete
   # @customer = Customer.find(current_customer.id)
   # if @customer.update!(admittion_status: "delete")

     # redirect_to customers_sign_out_path
   # end
>>>>>>> 5e93be0d65e06cdb66d97f04a3a073dae47c307c
  end
end
