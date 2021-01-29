class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_root

  def index
    @item = Item.find(params[:item_id])
    @purchase_item = PurchaseItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_item = PurchaseItem.new(purchase_item_params)
    if @purchase_item.valid?
       pay_item
       @purchase_item.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  def purchase_item_params
    params.require(:purchase_item).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_item_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
