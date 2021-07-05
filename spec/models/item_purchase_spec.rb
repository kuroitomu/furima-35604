require 'rails_helper'
RSpec.describe ItemPurchase, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @item_purchase = FactoryBot.build(:item_purchase, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end
  

    describe '商品購入機能' do
     context '登録がうまくいくとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@item_purchase).to be_valid
        end

        it 'buildingは空でも保存できること' do
          @item_purchase.building_name = ''
          expect(@item_purchase).to be_valid
        end
      end
      
      context '登録がうまくいかないとき' do

        it 'postal_codeが空だと保存できないこと' do
          @item_purchase.postal_code = ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @item_purchase.postal_code = '1234567'
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Postal code is invalid")
        end

        it 'prefectureを選択していないと保存できないこと' do
          @item_purchase.prefecture_id = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'prefectureが--だと保存できない' do
          @item_purchase.prefecture_id = 1
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Prefecture is invalid. Include")
        end

        it 'cityが空だと保存できないこと' do
          @item_purchase.city =''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("City can't be blank")
        end

        it 'house_numberが空だと登録できない' do
          @item_purchase.house_number =""
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
        end

        it 'phone_numberが空だと保存できないこと' do
          @item_purchase.phone_number =""
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end

        it 'phone_numberがハイフンあると保存できないこと' do
          @item_purchase.phone_number ='080-2222-222'
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが12桁以上あると保存できないこと' do
          @item_purchase.phone_number ='080222222222'
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが英数混合では登録できないこと' do
          @item_purchase.phone_number = "080222222222number"
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
        end

        it "tokenが空では登録できないこと" do
          @item_purchase.token = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
        end

        it "user_idが空では保存できないこと" do
          @item_purchase.user_id= ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("User can't be blank")
        end

        it "item_idが空では保存できないこと" do
          @item_purchase.item_id= ''
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
