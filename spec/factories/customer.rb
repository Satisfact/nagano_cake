FactoryBot.define do
  factory :customer do
    email { 'customer@test.com' }
    password { 'customer' }
    last_name { 'てすと' }
    first_name { 'ゆーざー' }
    last_kana { 'テスト' }
    first_kana { 'ユーザー' }
    postal_code { '1234567' }
    address { '東京都千代田区' }
    telephone_number { '00000000000' }
  end
end