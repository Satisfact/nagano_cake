class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postcode, :address, :name)
  end
end
