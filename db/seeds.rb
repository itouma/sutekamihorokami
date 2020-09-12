# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
4.times do |n|
  Exhibition.create!(
    email: "#{n}@#{n}",
    company_name: "株式会社テスト#{n}",
    password: "aaaaaa#{n}",
    # encrypted_password: "aaaaaa#{n}",
    company_name_kana: 'カブシキガイシャテスト',
    postal_code: '222-2222',
    phone_number: '22222222222',
    prefecture_id: '23',
    city: '名古屋',
    city_number: 'ポッカサッポロ',
    building_name: 'サントリー'
  )
end

4.times do |n|
  Customer.create!(
    email: "q@q#{n}",
    nickname: "test太郎#{n}",
    password: "qqqqqq#{n}",
    # encrypted_password: "qqqqqq#{n}",
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
end

Item.create!(
  [
    {
      name: 'ネギ1',
      price: '334',
      text: 'まがりネギです',
      category_id: '2',
      item_status_id: '1', 
      exhibition_id: '2'
    },
    {
      name: 'コーヒー',
      price: '500',
      text: 'ドトール',
      category_id: '5',
      item_status_id: '4',
      exhibition_id: '1' 
    },
    {
      name: 'ノート',
      price: '700',
      text: 'campus',
      category_id: '1',
      item_status_id: '2',
      exhibition_id: '3' 
    },
    {
      name: 'カップ',
      price: '3300',
      text: 'ビンテージ物です',
      category_id: '4',
      item_status_id: '4',
      exhibition_id: '4' 
    }
  ] 
)
Purchase.create!(
  customer_id: '2',
  item_id: '2'
)