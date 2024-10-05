require 'rails_helper'

RSpec.describe PurchaserHistory, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchaser_history = FactoryBot.build(:purchaser_history, user_id: user.id, item_id: item.id)
   end

  describe '商品購入' do
    context '購入できる場合' do
      it '全ての欄が埋まっていれば購入できる' do
        expect(@purchaser_history).to be_valid
      end
      it 'address_line2が空欄でも購入できる' do
        address_line2 = nil
        expect(@purchaser_history).to be_valid
      end
    end
    context '購入できない場合' do
      it 'tokenが空では購入できない' do
        @purchaser_history.token = ""
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空では購入できない' do
        @purchaser_history.postal_code = ''
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'areaが---では購入できない' do
        @purchaser_history.area_id = 1
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "Area can't be blank"
      end
      it 'cityが空では購入できない' do
        @purchaser_history.city = ''
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "City can't be blank"
      end
      it 'address_line1が空では購入できない' do
        @purchaser_history.address_line1 = ''
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "Address line1 can't be blank"
      end
      it 'phone_numberが空では購入できない' do
        @purchaser_history.phone_number = ''
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'postal_code が「3桁ハイフン4桁」の半角文字列でなければ購入できない' do
        @purchaser_history.postal_code = "1234567"
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include 'Postal code 半角数字の3桁-4桁で入力してください'
      end
      it 'phone_numberが9桁以下では購入できない' do
        @purchaser_history.phone_number = "Faker::Number.number(digits: 9)"
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include 'Phone number 半角数字の10～11桁で入力してください'
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchaser_history.phone_number = "Faker::Number.number(digits: 12)"
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include 'Phone number 半角数字の10～11桁で入力してください'
      end
      it '半角数字以外が含まれている場合、購入できない' do
        @purchaser_history.phone_number = "090-1234-5678"
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include 'Phone number 半角数字の10～11桁で入力してください'
      end
      it 'user_idが空では購入できない' do
        @purchaser_history.user_id = nil
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では購入できない' do
        @purchaser_history.item_id = nil
        @purchaser_history.valid?
        expect(@purchaser_history.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
