FactoryBot.define do
  factory :customer do
    name { 'テストユーザー' }
    email { 'test1@example.com' }
    password { 'password'}
  end
end