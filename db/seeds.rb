# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'test@test.com',
  password: 'testtest')
  
Customer.create!(
  email: 'customer@test.com',
  password: 'customer',
  last_name: '名字',
  first_name: '名前',
  last_kana: 'ミョウジ',
  first_kana: 'ナマエ',
  postcode: '0000000',
  address: '〇〇〇〇〇〇〇〇〇〇〇〇',
  telephone_number: '00000000000')
  