class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_item = PurchaseItem.new
  end

  def create
    @purchase_item = PurchaseItem.new(purchase_item_params)
    if @purchase_item.valid?
       @purchase_item.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  def purchase_item_params
    params.require(:purchase_item).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
