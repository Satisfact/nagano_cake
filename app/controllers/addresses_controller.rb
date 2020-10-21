class AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      redirect_to request.referer, notice: "配送先新規登録しました"
    end
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer != current_customer
      redirect_to addresses_path
    end
  end

  def update
    address = Address.find(params[:id])
    address.customer_id = current_customer.id
    if address.update(address_params)
      redirect_to addresses_path, notice: "配送先を編集しました"
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer, notice: "配送先を削除しました"
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postcode, :address, :name)
  end
end
