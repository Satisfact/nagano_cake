class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer =  Customer.find(params[:id])
  end

  def update
     @customer = current_customer
     @customer.update(customer_params)
     redirect_to
  end




  def destroy


    #ログアウトさせる

  end

 private
  def
  end

  end
end
