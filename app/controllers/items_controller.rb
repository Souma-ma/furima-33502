class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:image,:name,:contents,:category_id,:state_id,:postage_id,:region_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end
end
