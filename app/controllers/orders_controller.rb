class OrdersController < ApplicationController
  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:postalcode, :region_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
  end
end
