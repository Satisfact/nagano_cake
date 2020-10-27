class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!,
                :customer_find, only: [:show, :edit, :update]

  def index
    @customers = Customer.all
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to admins_customer_path(@customer.id), notice: "顧客情報編集しました"
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

  def customer_find
    @customer = Customer.find(params[:id])
  end
end
