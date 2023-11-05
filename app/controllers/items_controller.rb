class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
