require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  descrive "商品出品機能" do
    context '商品出品できるとき' do
      it "imageとnameとcontentsとcategory_idとstate_idとpostage_idとregion_idとshipping_idとpriceがあれば出品できる" do
        
      end
      it "category_idが1以外なら登録できる" do
        
      end
      it "state_idが1以外なら登録できる" do
        
      end
      it "postage_idが1以外なら登録できる" do
        
      end
      it "region_idが1以外なら登録できる" do
        
      end
      it "shipping_date_idが1以外なら登録できる" do
        
      end
      it "priceが300円以上なら登録できる" do
        
      end
      it "priceが9999999円以下なら登録できる" do
        
      end
    end
    context '商品出品できないとき' do
      
    end
  end
end
