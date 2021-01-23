require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  descrive "商品出品機能" do
    context '商品出品できるとき' do
      it "imageとnameとcontentsとcategory_idとstate_idとpostage_idとregion_idとshipping_idとpriceがあれば出品できる" do
        
      end
      it "category_idが1以外なら出品できる" do
        
      end
      it "state_idが1以外なら出品できる" do
        
      end
      it "postage_idが1以外なら出品できる" do
        
      end
      it "region_idが1以外なら出品できる" do
        
      end
      it "shipping_date_idが1以外なら出品できる" do
        
      end
      it "priceが300円以上なら出品できる" do
        
      end
      it "priceが9999999円以下なら出品できる" do
        
      end
    end
    context '商品出品できないとき' do
      it "商品画像が無ければ出品できない" do
        
      end
      it "nameが空では出品できない" do
        
      end
      it "contentsが空では出品できない" do
        
      end
      it "category_idが1なら出品できない" do
        
      end
      it "state_idが1なら出品できない" do
        
      end
      it "postage_idが1なら出品できない" do
        
      end
      it "region_idが1なら出品できない" do
        
      end
      it "shipping_date_idが1なら出品できない" do
        
      end
      it "priceが空では出品できない" do
        
      end
      it "priceが全角数字で入力されると出品できない" do
        
      end
      it "priceが300円未満なら出品できない" do
        
      end
      it "priceが9999999円以上なら出品できない" do
        
      end
    end
  end
end
