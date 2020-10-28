FactoryBot.define do
  factory :admin do
    email { 'admin@test.com' }
    password { 'admin' }
  end
end