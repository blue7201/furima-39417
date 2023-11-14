require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できる時' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipment).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_shipment.building = ''
        expect(@order_shipment).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it 'tokenが空では保存できない' do
        @order_shipment.token = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Token can't be blank")
      end

      it 'postalcodeが空では保存できない' do
        @order_shipment.postalcode = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postalcode can't be blank")
      end

      it 'region_idが空では保存できない' do
        @order_shipment.region_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Region can't be blank")
      end

      it 'region_idが"--"だと保存できない' do
        @order_shipment.region_id = 1
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Region must be other than 1")
      end

      it 'cityが空では保存できない' do
        @order_shipment.city = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では保存できない' do
        @order_shipment.block = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order_shipment.phone_number = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'postalcodeはハイフンがないと保存できない' do
        @order_shipment.postalcode = '1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postalcode is invalid")
      end

      it 'postalcodeは半角英数混合では保存できない' do
        @order_shipment.postalcode = '123-abcd'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postalcode is invalid")
      end

      it 'postalcodeは全角では保存できない' do
        @order_shipment.postalcode = '１２３-４５６７'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postalcode is invalid")
      end

      it 'phone_numberは12桁の数字では保存できない' do
        @order_shipment.phone_number = '090123456789'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは9桁以下の数字では保存できない' do
        @order_shipment.phone_number = '090123456'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは半角英数混合では保存できない' do
        @order_shipment.phone_number = 'abc123456789'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは全角では保存できない' do
        @order_shipment.phone_number = '０９０１２３４５６７８'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空だと保存できない' do
        @order_shipment.user_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @order_shipment.item_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
