# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Exhibition.create!(
  email: '2@2',
  company_name: '株式会社テスト2',
  password: '222222q',
  encrypted_password: '222222q',
  company_name_kana: 'カブシキガイシャテスト',
  postal_code: '222-2222',
  phone_number: '22222222222',
  prefecture_id: '23',
  city: '名古屋',
  city_number: 'ポッカサッポロ',
  building_name: 'サントリー'
)

  Customer.create!(
    email: 's@s',
    nickname: 'テスト太郎',
    password: 'ssssss1',
    encrypted_password: 'ssssss1',
    family_name: 'クァ',
    first_name: 'クァ',
    family_name_kana: 'クァ',
    first_name_kana: 'クァ',
    birthday: '1988-12-25',
    postal_code: '111-1111',
    phone_number: '11111111111',
    prefecture_id: '36',
    city: '川崎',
    city_number: '海域',
    building_name: 'エンピツ'
  )
