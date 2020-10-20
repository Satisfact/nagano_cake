class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postcode, :address, :name)
  end
end
