# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

BRANDS = ["Gucci", "Fendi", "Valentino", "Chanel", "Dior", "Prada", "Balenciaga", "Giuseppe Zanotti", "Louis Vuitton", "Hermès", "Christian Louboutin", "Jimmy Choo"]

puts "Cleaning Database ..."

User.destroy_all
Offer.destroy_all

puts "Start Seeding ..."

25.times do
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.unique.name,
    password: "password",
    password_confirmation: "password",
    address: Faker::Address.street_address
  )
  offer = Offer.create!(
    user_id: user.id,
    brand: BRANDS.sample,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    category: Offer::CATEGORIES.sample,
    size: Faker::Number.between(from: 35, to: 45),
    color: Faker::Color.color_name,
    price_per_day: Faker::Number.decimal(l_digits: 2)
  )
end
puts "#{User.count} users created"
puts "#{Offer.count} offers created"
