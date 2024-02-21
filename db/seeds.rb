require 'faker'
require 'open-uri'

Booking.destroy_all
Cosplay.destroy_all
User.destroy_all

user1 = User.create(email: '123@gmail.com', password: '123123')
user2 = User.create(email: 'ilovecosplay@gmail.com', password: 'ilovecosplay')
user3 = User.create(email: 'cosplayfantasy@hotmail.com', password: 'fantasy1234')
user4 = User.create(email: 'findcosplay123@hotmail.com', password: 'finding123')
user5 = User.create(email: 'cosplaylover@gmail.com', password: 'lovelovelove')

COSPLAYS = [
  {
    name: "Dark Vador",
    source_material: "Star Wars",
    price: 2000,
    size: "XS",
    image_url: "https://newcossky.fr/cdn/shop/products/11006195-cosplaystyle2014.jpg?v=1684143610",
    user: user1
  },
  {
    name: 'Anna',
    source_material: 'Spy Family',
    size: "M",
    price: 12000,
    user: user2,
    image_url:'https://i.pinimg.com/564x/17/44/85/17448573378518e8d7dd86552639f923.jpg'
  },
  {
    name: 'York',
    source_material: 'Spy Family',
    size: "L",
    price: 15000,
    user: user3,
    image_url:'https://ae01.alicdn.com/kf/S97d34b0b0a2f441a8218ef787f4aa656q/Anime-SPY-FAMILY-Cosplay-Yor-Forger-Cosplay-Costume-Manga-SPY-FAMILY-Cosplay-Costume-Women-Yor-Shoes.jpg'
  },
  {
    name: 'Sasuke',
    source_material: 'Naruto',
    size: "M",
    price: 8000,
    user: user4,
    image_url:'https://fortunecosplay.com/cdn/shop/products/Hot-Anime-Naruto-Sasuke-Uchiha-4nd-Cosplay-Costume-Ninja-Sasuke-Uchiha-4nd-Halloween-Party-Cosplay-Costume_grande.jpg?v=1608172661'
  },
  {
    name: 'Conan',
    source_material: 'Detective Conan',
    size: "S",
    price: 13000,
    user: user5,
    image_url:'https://s.alicdn.com/@sc04/kf/H8aa19be3e6964075aee1bf70cd56e5163.jpg_720x720q50.jpg'
  }
]

COSPLAYS.each do |cosplay|
  url = cosplay[:image_url]
  cosplay.delete(:image_url)
  cosplayitem = Cosplay.create(cosplay)
  cosplayitem.image.attach(
    io: URI.open(url),
    filename: 'cosplay.jpg',
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
