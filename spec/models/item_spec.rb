require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '全ての欄が埋まっていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it 'categoryが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'conditionが---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shipping_feeが---では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'areaが---では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'periodが---では登録できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Period can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが299以下では登録できない' do
        @item.price = rand(1..299)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = rand(10_000_000..100_000_000)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceは、全角だと登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
