require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  before do
    @purchase_item = FactoryBot.build(:purchase_item)
  end

  context '商品を購入できるとき' do
    it '入力必須の値が全て正しく入力されていれば商品を購入できる' do
      expect(@purchase_item).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @purchase_item.building = nil
      expect(@purchase_item).to be_valid
    end
  end

  context '商品を購入できないとき' do
    it 'postcodeが空では購入できない' do
      @purchase_item.postcode = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeはハイフンが無ければ購入できない' do
      @purchase_item.postcode = 1_234_567
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが空では購入できない' do
      @purchase_item.prefecture_id = 1
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空では購入できない' do
      @purchase_item.city = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空では購入できない' do
      @purchase_item.block = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Block can't be blank")
    end
    it 'phone_numberが空では購入できない' do
      @purchase_item.phone_number = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11桁以内でないと購入できない' do
      @purchase_item.phone_number = '090123456789'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Phone number is invalid.')
    end
    it 'phone_numberにハイフンがあれば購入できない' do
      @purchase_item.phone_number = '090-1234-5678'
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include('Phone number is invalid.')
    end
    it 'tokenが空では購入できない' do
      @purchase_item.token = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Token can't be blank")
    end
    it "item_idが空では登録できない" do
      @purchase_item.item_id = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("Item can't be blank")
    end
    it "user_idが空では登録できない" do
      @purchase_item.user_id = nil
      @purchase_item.valid?
      expect(@purchase_item.errors.full_messages).to include("User can't be blank")
    end
  end
end
