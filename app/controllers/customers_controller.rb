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
     redirect_to customers_mypage_path
    else
     render "edit"
    end
  end



  def destroy


    #ログアウトさせる

  end

 private
  def customer_params
    #params.require(:customer).permit(:name, :introduction, :profile_image)
  end

end
