require 'rails_helper'

describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
     it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
     end
  end
     
     it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
     end
  end

    context '新規登録がうまくいかないとき' do
     it "nicknameが空だと登録できない" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it "emailが空では登録できない" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it "emailに@が含まれていない場合登録できない" do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid? 
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

     it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers") #message change 
     end

     it "passwordが半角数字のみでは登録できない" do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers") #message change
     end

     it "passwordが全角では登録できないこと" do
      @user.password = '００００００' #password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers") #message change
     end

     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password = "000000"
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it "family_name_full_widthは全角(漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.family_name_full_width = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name full width is invalid")
     end

     it "first_name_full_widthは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name_full_width = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name full width is invalid")
     end
    
     it "family_name_kanaは全角（カタカナ）でなければ登録できない" do
      @user.family_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
     end

     it "first_name_kanaは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end

     it "family_name_full_widthが空では登録できない" do
      @user.family_name_full_width = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name full width can't be blank", "Family name full width is invalid")
     end

     it "first_name_full_widthが空では登録できない" do
      @user.first_name_full_width = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name full width can't be blank", "First name full width is invalid")
     end
     
     it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
     end

     it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
     end

     it "family_name_kanaがひらがな・カタカナ・漢字以外の場合は登録できない" do
       @user.family_name_kana = "yamada"
       @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana is invalid")
     end

     it "first_name_kanaがひらがな・カタカナ・漢字以外の場合は登録できない" do
      @user.first_name_kana = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end

      it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
  end