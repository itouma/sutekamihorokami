FactoryBot.define do
  factory :exhibition do
    company_name { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 7) }
    password_confirmation { password }

    company_name_kana { 'いイ伊' }
  end
end
