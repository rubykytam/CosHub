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
user6 = User.create(email: '456@gmail.com', password: '456456')
user7 = User.create(email: '789@gmail.com', password: '789789')

COSPLAYS = [
  {
    name: "Dark Vader",
    source_material: "Star Wars",
    price: 2000,
    size: "XS",
    image_url: ["https://newcossky.fr/cdn/shop/products/11006195-cosplaystyle2014.jpg?v=1684143610"],
    user: user1
  },
  {
    name: 'Anya Forger',
    source_material: 'Spy Family',
    size: "M",
    price: 12000,
    user: user2,
    image_url:['https://i.pinimg.com/564x/17/44/85/17448573378518e8d7dd86552639f923.jpg','https://i.ebayimg.com/images/g/6UwAAOSweqZk0G90/s-l1600.jpg']
  },
  {
    name: 'Yor Forger',
    source_material: 'Spy Family',
    size: "L",
    price: 15000,
    user: user3,
    image_url:['https://ae01.alicdn.com/kf/S97d34b0b0a2f441a8218ef787f4aa656q/Anime-SPY-FAMILY-Cosplay-Yor-Forger-Cosplay-Costume-Manga-SPY-FAMILY-Cosplay-Costume-Women-Yor-Shoes.jpg','https://gvavayacosplay.com/cdn/shop/products/1_d094f77f-f5cf-496a-b135-d2b7af77bc29.jpg?v=1650336148']
  },
  {
    name: 'Sasuke',
    source_material: 'Naruto',
    size: "M",
    price: 8000,
    user: user4,
    image_url:['https://fortunecosplay.com/cdn/shop/products/Hot-Anime-Naruto-Sasuke-Uchiha-4nd-Cosplay-Costume-Ninja-Sasuke-Uchiha-4nd-Halloween-Party-Cosplay-Costume_grande.jpg?v=1608172661']
  },
  {
    name: 'Conan',
    source_material: 'Detective Conan',
    size: "S",
    price: 13000,
    user: user5,
    image_url:['https://s.alicdn.com/@sc04/kf/H8aa19be3e6964075aee1bf70cd56e5163.jpg_720x720q50.jpg','https://m.media-amazon.com/images/I/61n8wRrdlrL._AC_UF894,1000_QL80_.jpg']
  },
  {
    name: 'Doraemon',
    source_material: 'Doraemon',
    size: "XL",
    price: 3000,
    user: user5,
    image_url:['https://laz-img-sg.alicdn.com/p/11c75ab7b6a3cfeb0c6e5b50434575f6.jpg']
  },
  {
    name: 'Shokudaikiri',
    source_material: 'Toukeranbu',
    size: "L",
    price: 5500,
    user: user2,
    image_url:['https://clould.ohcosplay.com/images/cosplaymade20170329/QYY080.jpg']
  },
  {
    name: 'kyuujo Ten',
    source_material: 'Idolish7',
    size: "M",
    price: 6500,
    user: user2,
    image_url:['https://ae01.alicdn.com/kf/HTB1y9BfPXXXXXcNaXXXq6xXFXXXc/COSPLAYONSEN-Idolish7-Trigger-Tenn-Kujo-Cosplay-Costume-Full-Set-All-Sizes-adult-costume.jpg']
  },
  {
    name: 'Nico',
    source_material: 'Love Live',
    size: "M",
    price: 7500,
    user: user3,
    image_url:['https://cosplayflying.com/cdn/shop/products/Anime_Love_Live_Taisho_Kimono_Awakening_Yazawa_Nico_Cosplay_Costume_Custom_Made_for_Girls_Adult_Women_Halloween_Carnival_Party_Outfits-1_1000x.jpg?v=1574754888']
  },
  {
    name: 'Tokai Teio',
    source_material: 'Uma Musume',
    size: "M",
    price: 7500,
    user: user4,
    image_url:['https://www.cosplayclass.com/wp-content/uploads/2018/12/Uma-Musume-Pretty-Derby-Toukai-Teiou-Tokai-Cosplay-Costume-1.jpg']
  },
  {
    name: 'UNDEAD',
    source_material: 'Ensemble Star',
    size: "L",
    price: 5000,
    user: user1,
    image_url:['https://trendsincosplay.com/cdn/shop/products/9d53e4c1a226b95611fb709247a776ff.jpg?v=1657874658']
  },
  {
    name: 'Tsurotairou',
    source_material: 'Twisted Wonderland',
    size: "L",
    price: 8000,
    user: user2,
    image_url:['https://cosplayflying.com/cdn/shop/products/GameTwisted-WonderlandSleepingBeautyMalleusDraconiaCosplayCostumeMaleUniformOutfit-1_1000x.jpg?v=1588231807','https://cossky.com/cdn/shop/products/05d2a559b4edabe510cb192bdda882f2_600x.jpg?v=1589437523']
  },
  {
    name: 'Ai',
    source_material: 'Oshi no Ko',
    size: "S",
    price: 5000,
    user: user6,
    image_url:['https://gvavayacosplay.com/cdn/shop/products/0_278c007c-43af-4ff3-b26f-a48c1409efef.jpg?v=1681727447','https://coshd.co.uk/cdn/shop/products/40bc76e04ac72f73133763ccfb53125d.jpg?v=1696819596']
  },
  {
    name: 'Leon',
    source_material: 'Pokemon',
    size: "XL",
    price: 4000,
    user: user6,
    image_url:['https://ycosplay.com/cdn/shop/products/1_f7ed33db-7f55-477e-a761-17955950e7d5.jpg?v=1592978992','https://i.ebayimg.com/images/g/RKMAAOSw-ktfolbX/s-l1600.jpg']
  },
  {
    name: 'James',
    source_material: 'Pokemon',
    size: "XL",
    price: 3500,
    user: user6,
    image_url:['https://cdn.costumewall.com/wp-content/plugins/image-hot-spotter/images/JamesTeamRocketCostumeOutfit.jpg']
  },
  {
    name: 'Ace',
    source_material: 'One Piece',
    size: "XL",
    price: 2500,
    user: user6,
    image_url:['https://ae01.alicdn.com/kf/S7218bfed061045419193295e0b7938ebl.jpg_640x640Q90.jpg_.webp']
  },
  {
    name: 'Chloe',
    source_material: 'The Promise of Wizard',
    size: "L",
    price: 4900,
    user: user6,
    image_url:['https://m.media-amazon.com/images/I/511pCvowEJL._AC_UF894,1000_QL80_.jpg']
  },
  {
    name: 'Frieren',
    source_material: 'Beyond Journey',
    size: "M",
    price: 8000,
    user: user3,
    image_url:['https://gvavayacosplay.com/cdn/shop/files/8.21-5.jpg?v=1692613934','https://ae01.alicdn.com/kf/S5dc8e653010645ca97acd469ddde1101k.jpg_640x640Q90.jpg']
  },
  {
    name: 'Lilia',
    source_material: 'Twisted Wonderland',
    size: "M",
    price: 7000,
    user: user3,
    image_url:['https://cdn.shopify.com/s/files/1/0052/4032/4168/products/GameTwisted-WonderlandSleepingBeautyLiliaVanrougeCosplayCostumeMaleUniformOutfit-1_300x.jpg?v=1587622985','https://www.cosplayclan.com/cdn/shop/products/5_27a97ee9-ff9c-4b2b-ac76-cd7d660635d6_800x.jpg?v=1659325851']
  },
  {
    name: 'Syo',
    source_material: 'Uta no Prince',
    size: "S",
    price: 3000,
    user: user2,
    image_url:['https://www.cosercosplay.com/images/cosplay/Uta%20no%20Prince%20sama%20Syo%20Kurusu%20Saotome%20Academy%20School%20Uniofrm%20Cosplay%20Costume%20001%20(3).jpg']
  },
  {
    name: 'Shimakaze',
    source_material: 'Kannmusume',
    size: "S",
    price: 8000,
    user: user4,
    image_url:['https://down-vn.img.susercontent.com/file/c38d867affcb89974257312222e2c615']
  }

]

COSPLAYS.each do |cosplay|
  urls = cosplay[:image_url]
  cosplay.delete(:image_url)
  cosplayitem = Cosplay.create(cosplay)
  urls.each do |url|
    cosplayitem.images.attach(
      io: URI.open(url),
      filename: 'cosplay.jpg',
      content_type: "image/jpg"
    )
  end
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
