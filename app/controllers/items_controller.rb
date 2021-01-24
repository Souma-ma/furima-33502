class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_item, only: [:show,:edit]

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
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
     item.destroy
     redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :contents, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id,
                                 :price).merge(user_id: current_user.id)
  end
  
  def get_item
    @item = Item.find(params[:id])
  end
end
