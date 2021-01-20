require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "nicknameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirth_dayが存在すれば登録できる" do

      end
      it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      
      end
      it "last_nameとfirst_nameが全角であれば登録できる" do
        
      end
      it "last_name_kanaとfirst_name_kanaがカタカナであれば登録できる" do
        
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空では登録できない" do

      end
      it "emailが空では登録できない" do

      end
      it "重複したemailが存在する場合登録できない" do

      end
      it "passwordが空では登録できない" do

      end
      it "passwordが5文字以下では登録できない" do

      end
      it "passwordが半角英数でなければ登録できない" do

      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do

      end
      it "passwordとpassword_confirmationの値が一致しなければ登録できない" do

      end
      it "last_nameが空では登録できない" do

      end
      it "first_nameが空では登録できない" do

      end
      it "last_name_kanaが空では登録できない" do

      end
      it "first_name_kanaが空では登録できない" do

      end
      it "last_nameが半角で入力されると登録できない" do

      end
      it "first_nameが半角で入力されると登録できない" do

      end
      it "last_name_kanaがカタカナ以外で入力されると登録できない" do

      end
      it "first_name_kanaがカタカタ以外で入力されると登録できない" do

      end
      it "生年月日が空だと登録できない" do

      end
    end
  end
end
