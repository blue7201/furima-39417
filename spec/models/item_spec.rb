require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報を保存できるとき' do
      it 'item_name、description、category_id、state_id、postal_id、region_id、shipping_date_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報を保存できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'state_idが空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'region_idが空では登録できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'category_idが"--"では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'state_idが"--"では登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it 'postage_idが"--"では登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it 'region_idが"--"では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end
      it 'shipping_date_idが"--"では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end
      it 'priceが299では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが100000000では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角文字では登録できない' do
        @item.price = 'てすと'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = 'ab123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語だけでは登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
