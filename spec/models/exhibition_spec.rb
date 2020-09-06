require 'rails_helper'

RSpec.describe Exhibition, type: :model do
  describe 'ユーザー新規登録#create' do
    before do
      @exhibition = FactoryBot.build(:exhibition)
    end

    # it 'nicknameとemail、passwordとpassword_confirmation、birthdayとfirst_nameとfamily_nameとfirst_name_kanaとfamily_name_kanaが存在すれば登録できること' do
    #   expect(@exhibition).to be_valid
    # end

    # # ##########nicknameのテストコード#########
    # it 'nicknameが空では登録できないこと' do
    #   @exhibition.nickname = nil
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include("Nickname can't be blank")
    # end

    # ##########emailのテストコード#########
    it 'emailが空では登録できないこと' do
      @exhibition.email = nil
      @exhibition.valid?
      expect(@exhibition.errors.full_messages).to include("Email can't be blank")
    end

    # it 'emailが重複していると登録できないこと' do
    #   @exhibition.save
    #   another_user = FactoryBot.build(:user, email: @exhibition.email)
    #   another_user.valid?
    #   expect(another_user.errors.full_messages).to include('Email has already been taken')
    # end

    it 'emailに@が1つもないと登録できないこと' do
      @exhibition.email = 'aaagmail.com'
      @exhibition.valid?
      expect(@exhibition.errors.full_messages).to include('Email is invalid')
    end
    it 'emailに@が必ず1つあれば登録できること' do
      @exhibition.email = 'a@aagmail.com'
      expect(@exhibition) .to be_valid
    end

    # # ##########passwordのテストコード#########
    # it 'passwordが空では登録できないこと' do
    #   @exhibition.password = nil
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include("Password can't be blank", 'Password Include both letters and numbers')
    # end

    # it 'passwordが半角英数字を折り混ぜない場合は登録できないこと' do
    #   @exhibition.password = 'あいうえおか'
    #   @exhibition.password_confirmation = 'あいうえおか'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Password Include both letters and numbers')
    #   @exhibition.password = '123456'
    #   @exhibition.password_confirmation = '123456'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Password Include both letters and numbers')
    #   @exhibition.password = 'aaaaaa'
    #   @exhibition.password_confirmation = 'aaaaaa'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Password Include both letters and numbers')
    # end

    it 'passwordが5文字以下だと登録できないこと' do
      @exhibition.password = '1234a'
      @exhibition.password_confirmation = '1234a'
      @exhibition.valid?
      expect(@exhibition.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字を折り混ぜかつ、6文字以上であれば登録できること' do
      @exhibition.password = '12345a'
      @exhibition.password_confirmation = '12345a'
      expect(@exhibition) .to be_valid
    end

    # ##########password_confirmationのテストコード#########
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @exhibition.password_confirmation = ''
      @exhibition.valid?
      expect(@exhibition.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # # ##########birthdayのテストコード#########
    # it 'birthdayが空では登録できないこと' do
    #   @exhibition.birthday = nil
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include("Birthday can't be blank")
    # end

    # # ##########first_nameのテストコード#########
    # it 'first_nameが空では登録できないこと' do
    #   @exhibition.first_name = nil
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include("First name can't be blank", 'First name Full-width characters')
    # end

    # it 'first_nameが全角以外は登録できないこと' do
    #   @exhibition.first_name = '123456'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('First name Full-width characters')
    #   @exhibition.first_name = 'abcdef'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('First name Full-width characters')
    #   @exhibition.first_name = 'ｱｲｳｴｵ'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('First name Full-width characters')
    # end

    # it 'first_nameが全角だと登録できること' do
    #   @exhibition.first_name = 'あア亜１ａＺ'
    #   expect(@exhibition) .to be_valid
    # end

    # # ##########family_nameのテストコード#########
    # it 'family_nameが空では登録できないこと' do
    #   @exhibition.family_name = nil
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include("Family name can't be blank", 'Family name Full-width characters')
    # end

    # it 'family_nameが全角以外は登録できないこと' do
    #   @exhibition.family_name = '123456'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name Full-width characters')
    #   @exhibition.family_name = 'abcdef'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name Full-width characters')
    #   @exhibition.family_name = 'ｱｲｳｴｵ'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name Full-width characters')
    # end

    # it 'family_nameが全角だと登録できること' do
    #   @exhibition.family_name = 'あア亜１ａＺ'
    #   expect(@exhibition) .to be_valid
    # end

    # # ########first_name_kanaのテストコード############
    # it 'first_name_kanaが空では登録できないこと' do
    #   @exhibition.first_name_kana = nil
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include("First name kana can't be blank", 'First name kana Full-width katakana characters')
    # end

    # it 'first_name_kanaがカタカナ全角以外は登録できないこと' do
    #   @exhibition.first_name_kana = '123456'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('First name kana Full-width katakana characters')
    #   @exhibition.first_name_kana = 'abcdef'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('First name kana Full-width katakana characters')
    #   @exhibition.first_name_kana = 'ｱｲｳｴｵ'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('First name kana Full-width katakana characters')
    #   @exhibition.first_name_kana = 'あいうえお'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('First name kana Full-width katakana characters')
    # end

    # it 'first_name_kanaがカタカナ全角だと登録できること' do
    #   @exhibition.first_name_kana = 'アイウエオ'
    #   expect(@exhibition) .to be_valid
    # end

    # # ##########family_name_kanaのテストコード#########
    # it 'family_name_kanaが空では登録できないこと' do
    #   @exhibition.family_name_kana = nil
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana Full-width katakana characters')
    # end

    # it 'family_name_kanaがカタカナ全角以外は登録できないこと' do
    #   @exhibition.family_name_kana = '123456'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name kana Full-width katakana characters')
    #   @exhibition.family_name_kana = 'abcdef'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name kana Full-width katakana characters')
    #   @exhibition.family_name_kana = 'ｱｲｳｴｵ'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name kana Full-width katakana characters')
    #   @exhibition.family_name_kana = 'あいうえお'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name kana Full-width katakana characters')
    #   @exhibition.family_name_kana = '１２３ｚ'
    #   @exhibition.valid?
    #   expect(@exhibition.errors.full_messages).to include('Family name kana Full-width katakana characters')
    # end

    # it 'family_name_kanaがカタカナ全角だと登録できること' do
    #   @exhibition.family_name_kana = 'アイウエオ'
    #   expect(@exhibition) .to be_valid
    # end
  end
end
