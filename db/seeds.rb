require 'ffaker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category_list = [
  "sweet",
  "savory",
  "high fat",
  "high carb",
  "high protein",
  "alcohol"
]

category_list.each do |name|
  Category.create(name: name)
end

type_list = [
  "meal",
  "snack",
  "drink"
]

type_list.each do |name|
  Type.create(name: name)
end

100.times do
  Mood.create(level: rand(1..10), user_id: 1, time:FFaker::Time.between(30.days.ago, Time.now))
end

10.times do
  User.create(user_name:FFaker::Internet.user_name, email:FFaker::Internet.email, password:123456, date_of_birth:FFaker::Time.date )
end


100.times do
  Food.create(user_id: 1, category_id: rand(1..6), type_id: rand(1..3), time_consumed:FFaker::Time.between(30.days.ago, Time.now))
end
