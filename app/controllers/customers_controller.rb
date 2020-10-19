class CustomersController < ApplicationController
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
  end
end
