require 'faker'
require 'open-uri'

Booking.destroy_all
Cosplay.destroy_all
User.destroy_all

User.create(email: '123@gmail.com', password: '123123')

10.times do
  u = User.create!(
    email: Faker::Internet.email,
    password: '123123'
  )
  c = Cosplay.create!(
    name: Faker::Artist.name,
    source_material: Faker::Game.title,
    size: Cosplay::SIZE.sample,
    price: 30000,
    user: u
  )
  c.image.attach(
    io:  URI.open('https://i.pinimg.com/564x/17/44/85/17448573378518e8d7dd86552639f923.jpg'),
    filename: 'image.jpg',
    content_type: "image/jpg"
  )
end




# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
