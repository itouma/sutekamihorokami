require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'ユーザー新規登録#create' do
    before do
      @customer = FactoryBot.build(:customer)
    end

    it 'nicknameとemail、passwordとpassword_confirmation、birthdayとfirst_nameとfamily_nameとfirst_name_kanaとfamily_name_kanaが存在すれば登録できること' do
      expect(@customer).to be_valid
    end

    # ##########nicknameのテストコード#########
    it 'nicknameが空では登録できないこと' do
      @customer.nickname = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Nickname can't be blank")
    end

    # ##########emailのテストコード#########
    it 'emailが空では登録できないこと' do
      @customer.email = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複していると登録できないこと' do
      @customer.save
      another_user = FactoryBot.build(:user, email: @customer.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が1つもないと登録できないこと' do
      @customer.email = 'aaagmail.com'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Email is invalid')
    end
    it 'emailに@が必ず1つあれば登録できること' do
      @customer.email = 'a@aagmail.com'
      expect(@customer) .to be_valid
    end

    # ##########passwordのテストコード#########
    it 'passwordが空では登録できないこと' do
      @customer.password = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Password can't be blank", 'Password Include both letters and numbers')
    end

    it 'passwordが半角英数字を折り混ぜない場合は登録できないこと' do
      @customer.password = 'あいうえおか'
      @customer.password_confirmation = 'あいうえおか'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Password Include both letters and numbers')
      @customer.password = '123456'
      @customer.password_confirmation = '123456'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Password Include both letters and numbers')
      @customer.password = 'aaaaaa'
      @customer.password_confirmation = 'aaaaaa'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが5文字以下だと登録できないこと' do
      @customer.password = '1234a'
      @customer.password_confirmation = '1234a'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字を折り混ぜかつ、6文字以上であれば登録できること' do
      @customer.password = '12345a'
      @customer.password_confirmation = '12345a'
      expect(@customer) .to be_valid
    end

    # ##########password_confirmationのテストコード#########
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @customer.password_confirmation = ''
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # ##########birthdayのテストコード#########
    it 'birthdayが空では登録できないこと' do
      @customer.birthday = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Birthday can't be blank")
    end

    # ##########first_nameのテストコード#########
    it 'first_nameが空では登録できないこと' do
      @customer.first_name = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("First name can't be blank", 'First name Full-width characters')
    end

    it 'first_nameが全角以外は登録できないこと' do
      @customer.first_name = '123456'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('First name Full-width characters')
      @customer.first_name = 'abcdef'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('First name Full-width characters')
      @customer.first_name = 'ｱｲｳｴｵ'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('First name Full-width characters')
    end

    it 'first_nameが全角だと登録できること' do
      @customer.first_name = 'あア亜１ａＺ'
      expect(@customer) .to be_valid
    end

    # ##########family_nameのテストコード#########
    it 'family_nameが空では登録できないこと' do
      @customer.family_name = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Family name can't be blank", 'Family name Full-width characters')
    end

    it 'family_nameが全角以外は登録できないこと' do
      @customer.family_name = '123456'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name Full-width characters')
      @customer.family_name = 'abcdef'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name Full-width characters')
      @customer.family_name = 'ｱｲｳｴｵ'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name Full-width characters')
    end

    it 'family_nameが全角だと登録できること' do
      @customer.family_name = 'あア亜１ａＺ'
      expect(@customer) .to be_valid
    end

    # ########first_name_kanaのテストコード############
    it 'first_name_kanaが空では登録できないこと' do
      @customer.first_name_kana = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("First name kana can't be blank", 'First name kana Full-width katakana characters')
    end

    it 'first_name_kanaがカタカナ全角以外は登録できないこと' do
      @customer.first_name_kana = '123456'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('First name kana Full-width katakana characters')
      @customer.first_name_kana = 'abcdef'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('First name kana Full-width katakana characters')
      @customer.first_name_kana = 'ｱｲｳｴｵ'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('First name kana Full-width katakana characters')
      @customer.first_name_kana = 'あいうえお'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('First name kana Full-width katakana characters')
    end

    it 'first_name_kanaがカタカナ全角だと登録できること' do
      @customer.first_name_kana = 'アイウエオ'
      expect(@customer) .to be_valid
    end

    # ##########family_name_kanaのテストコード#########
    it 'family_name_kanaが空では登録できないこと' do
      @customer.family_name_kana = nil
      @customer.valid?
      expect(@customer.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana Full-width katakana characters')
    end

    it 'family_name_kanaがカタカナ全角以外は登録できないこと' do
      @customer.family_name_kana = '123456'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name kana Full-width katakana characters')
      @customer.family_name_kana = 'abcdef'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name kana Full-width katakana characters')
      @customer.family_name_kana = 'ｱｲｳｴｵ'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name kana Full-width katakana characters')
      @customer.family_name_kana = 'あいうえお'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name kana Full-width katakana characters')
      @customer.family_name_kana = '１２３ｚ'
      @customer.valid?
      expect(@customer.errors.full_messages).to include('Family name kana Full-width katakana characters')
    end

    it 'family_name_kanaがカタカナ全角だと登録できること' do
      @customer.family_name_kana = 'アイウエオ'
      expect(@customer) .to be_valid
    end
  end
end
