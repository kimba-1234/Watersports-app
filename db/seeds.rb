# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Destroying all seed data..."
Review.destroy_all
Booking.destroy_all
ListingSlot.destroy_all
Listing.destroy_all
User.destroy_all

puts "Destroyed all seed data."

client_1 = User.create!(email: "andrew@email.com", password: "abcd123", first_name: "Andrew", last_name: "Brown",
    phone_number: "+6299900088", user_type: "client", vendor_name: "", vendor_description: "")
client_2 = User.create!(email: "hello@test.com", password: "abcd123", first_name: "Christina", last_name: "Sugiono",
    phone_number: "+6299908268", user_type: "client", vendor_name: "", vendor_description: "")
client_3 = User.create!(email: "christian@choosemyescort.com", password: "abcd123", first_name: "Christian", last_name: "Morris",
    phone_number: "+6299908998", user_type: "client", vendor_name: "", vendor_description: "")

vendor_1 = User.create!(email: "philboss@email.com", password: "abc456", first_name: "Phil", last_name: "Boss",
    phone_number: "+621234567", user_type: "vendor", vendor_name: "PhilBoss Scuba Venture", vendor_description: "the best scuba boat trip in Bali")
vendor_2 = User.create!(email: "sharkeysnorkles@email.com", password: "abc123", first_name: "Ian", last_name: "Sharkey",
    phone_number: "+621200067", user_type: "vendor", vendor_name: "Sharkey Snorkles", vendor_description: "You'll see some beautiful sealife when you snorkle with Sharkey!")


listing_1 = Listing.new(title: "Scuba dive with turtles", description: "Get within 1m of these magnificent creatures when you scuba dive with turtles.
  Walk at the bottom of the sea without getting your hair wet. Sea walker is a soft dive system that is designed specifically for those who are not confident swimmers or do not wish to dive. All you will need to do is put on a helmet with a transparent visor and head on down to explore Bali’s stunning underwater life with a professional.", user: vendor_1, location: "Nusa Penida", duration: 5, price: 89.99)
photo1 = URI.open('https://images.unsplash.com/photo-1558281050-4c33200099c7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80')
listing_1.photos.attach(io: photo1, filename: 'turtle1.jpg', content_type: 'image/jpg')
photo1_2 = URI.open('https://imgix.bustle.com/rehost/2016/9/13/2d0de11d-a376-4691-8b62-04f91cd35e78.jpg?w=800&fit=crop&crop=faces&auto=format%2Ccompress')
listing_1.photos.attach(io: photo1_2, filename: 'turtle2.jpg', content_type: 'image/jpg')
photo1_3 = URI.open('https://files.worldwildlife.org/wwfcmsprod/images/CROPPED_Green_Sea_Turtle_Hawaii/magazine_hero/2li6lcotfp_Medium_WW1113937.jpg')
listing_1.photos.attach(io: photo1_3, filename: 'turtle3.jpg', content_type: 'image/jpg')
listing_1.save!

listing_2 = Listing.new(title: "Swim with Nemo", description: "See hundreds of colourful fish on this snorkelling adventure", user: vendor_2, location: "Gili Island", duration: 8, price: 49.99)
photo2 = URI.open('https://images.unsplash.com/photo-1597799119438-cbf326f268b9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2833&q=80')
listing_2.photos.attach(io: photo2, filename: 'image2.jpg', content_type: 'image/jpg')
photo2_2 = URI.open('https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/10/4166255578.jpg')
listing_2.photos.attach(io: photo2_2, filename: 'image2.jpg', content_type: 'image/jpg')
photo2_3= URI.open('https://media-cldnry.s-nbcnews.com/image/upload/newscms/2016_18/1075561/finding-nemo-dory-today-160504-tease-02.jpg')
listing_2.photos.attach(io: photo2_3, filename: 'image2.jpg', content_type: 'image/jpg')
listing_2.save!

listing_3 = Listing.new(title: "Surf and swim in Uluwatu", description: "Enjoy the beach and the waves on this surfing adventure", user: vendor_2, location: "Uluwatu", duration: 4, price: 30.50)
photo3 = URI.open('https://images.unsplash.com/photo-1610666025104-7ae9de779215?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80')
listing_3.photos.attach(io: photo3, filename: 'image3.jpg', content_type: 'image/jpg')
photo3_2 = URI.open('https://www.surfindonesia.com/wp-content/uploads/2020/07/outside-corner-uluwatu-scaled-1.jpg?_t=1598348078')
listing_3.photos.attach(io: photo3_2, filename: 'image3.jpg', content_type: 'image/jpg')
photo3_3 = URI.open('https://i.pinimg.com/1200x/52/31/42/523142f9c0684b2faa51183764393915.jpg')
listing_3.photos.attach(io: photo3_3, filename: 'image3.jpg', content_type: 'image/jpg')
listing_3.save!

listing_4 = Listing.new(title: "WaterBOM", description: "Make a splash at one of the best water parks in the world!", user: vendor_1, location: "Kuta", duration: 8, price: 69.99)
photo4_1 = URI.open('https://res.cloudinary.com/dh8uxggfc/image/upload/v1692953338/waterbom-bali_k3vsyp.jpg')
listing_4.photos.attach(io: photo4_1, filename: 'waterbom.jpg', content_type: 'image/jpg')
listing_4.save!

listing_5 = Listing.new(title: "White Water Rafting", description: "Get your adrenaline fix with this exciting and thrilling water adventure.", user: vendor_1, location: "Ubud", duration: 3, price: 89.99)
photo5_1 = URI.open('https://res.cloudinary.com/dh8uxggfc/image/upload/v1692953322/bali_rafting_ljz0d9.jpg')
listing_5.photos.attach(io: photo5_1, filename: 'rafting.jpg', content_type: 'image/jpg')
listing_5.save!

listing_6 = Listing.new(title: "Deep Sea Fishing", description: "Appreciate the ocean with this deep sea fishing trip.", user: vendor_1, location: "Nusa Penida", duration: 12, price: 149.29)
photo6_1 = URI.open('https://res.cloudinary.com/dh8uxggfc/image/upload/v1692953303/bali_fishing_pjjcoe.jpg')
listing_6.photos.attach(io: photo6_1, filename: 'fishing.jpg', content_type: 'image/jpg')
listing_6.save!

listing_slot_1 = ListingSlot.create!(listing: listing_1, start_time: DateTime.parse('10 Sept 2023 09:45:00'), end_time: DateTime.parse('10 Sept 2023 17:00:00'), booked: true)
listing_slot_2 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('12 Sept 2023 11:45:00'), end_time: DateTime.parse('12 Sept 2023 17:00:00'), booked: true)
listing_slot_3 = ListingSlot.create!(listing: listing_1, start_time: DateTime.parse('13 Sept 2023 13:45:00'), end_time: DateTime.parse('13 Sept 2023 17:00:00'), booked: true)
listing_slot_4 = ListingSlot.create!(listing: listing_3, start_time: DateTime.parse('23 Sept 2023 15:45:00'), end_time: DateTime.parse('23 Sept 2023 17:00:00'), booked: true)
listing_slot_5 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('24 Sept 2023 17:45:00'), end_time: DateTime.parse('24 Sept 2023 19:00:00'))
listing_slot_6 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('25 Sept 2023 18:45:00'), end_time: DateTime.parse('25 Sept 2023 21:00:00'))
listing_slot_7 = ListingSlot.create!(listing: listing_1, start_time: DateTime.parse('26 Sept 2023 09:45:00'), end_time: DateTime.parse('26 Sept 2023 17:00:00'))
listing_slot_8 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('28 Sept 2023 11:45:00'), end_time: DateTime.parse('25 Sept 2023 17:00:00'))
listing_slot_9 = ListingSlot.create!(listing: listing_3, start_time: DateTime.parse('1 Oct 2023 15:45:00'), end_time: DateTime.parse('1 Oct 2023 17:00:00'))
listing_slot_10 = ListingSlot.create!(listing: listing_1, start_time: DateTime.parse('1 Oct 2023 09:45:00'), end_time: DateTime.parse('1 Oct 2023 17:00:00'))
listing_slot_11 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('3 Oct 2023 11:45:00'), end_time: DateTime.parse('3 Oct 2023 17:00:00'))


booking_1 = Booking.create!(listing_slot: listing_slot_1, user: client_1)
booking_2 = Booking.create!(listing_slot: listing_slot_2, user: client_1)
booking_3 = Booking.create!(listing_slot: listing_slot_3, user: client_2)
booking_4 = Booking.create!(listing_slot: listing_slot_4, user: client_2)

review_1 = Review.create!(rating: 5, comment: "review comment", listing: listing_1, user: client_1)
review_2 = Review.create!(rating: 3, comment: "where is dory?", listing: listing_2, user: client_1)

puts "Seed success ! "
