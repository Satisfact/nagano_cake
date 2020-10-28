FactoryBot.define do
  factory :customer do
    email { 'test1@example.com' }
    password { 'password'}
    last_name { 'テスト' }
    first_name { '' }
    last_kana { '' }
    first_kana { '' }
    postal_code { '' }
    address { '' }
    telephone_number 
  end
end