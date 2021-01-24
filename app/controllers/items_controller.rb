class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && item.user_id == current_user.id
     item.destroy
     redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :contents, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id,
                                 :price).merge(user_id: current_user.id)
  end
end
