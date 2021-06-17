require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '全ての項目の入力が存在すれば商品出品ができる' do
        expect(@item).to be_valid
      end

    it 'priceが半角数字なら出品できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
  end

    context '商品出品ができない時' do
      it 'categoryが空だと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'product_statusが空だと保存できない' do
        @item.product_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank", "Product status is not a number")
      end

      it 'shipping_chargesが空だと保存できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank", "Shipping charges is not a number")
      end

      it 'prefecturesが空だと保存できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank", "Prefectures is not a number")
      end

      it 'shipping_timeが空だと保存できない' do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank", "Shipping time is not a number")
      end

      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end

      it 'imageがないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'product_explanationが空だと保存できない' do
        @item.product_explanation  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product explanation can't be blank")
      end

      it 'categoryが--だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'product_statusが--だと保存できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status must be other than 1")
      end

      it 'shipping_chargesが--だと保存できない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end

      it 'prefecturesが--だと保存できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end

      it 'shipping_timeが--だと保存できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time must be other than 1")
      end

      it 'priceが300円以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999円以上だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが全角数字だと保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
      it 'priceは半角英数混合では登録できないこと' do
        @item.price = "300yen"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceは半角英語だけでは登録できないこと' do
        @item.price = 'three handlet'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end