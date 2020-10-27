FactoryBot.define do 
  factory :task do
    name { 'テストを書く' }
    discription { 'Tspec & Capybara & FactoryBotを準備する' }
    customer
  end
end