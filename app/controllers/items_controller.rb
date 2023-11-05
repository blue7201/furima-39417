class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  private

  def message_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end

end
