class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set
  before_action :move_to_root
  before_action :direct_top
  

  def index
    @purchase_item = PurchaseItem.new
  end

  def create
    @purchase_item = PurchaseItem.new(purchase_item_params)
    if @purchase_item.valid?
      pay_item
      @purchase_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_item_params
    params.require(:purchase_item).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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

  def direct_top
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
  end

  def item_set
    @item = Item.find(params[:item_id])
  end
end
