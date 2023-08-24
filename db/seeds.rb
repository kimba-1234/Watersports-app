# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying all seed first"
Review.destroy_all
Booking.destroy_all
ListingSlot.destroy_all
Listing.destroy_all
User.destroy_all

puts "destroy success"

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

image1 = URI.open('https://images.unsplash.com/photo-1558281050-4c33200099c7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80')
listing_1 = Listing.new(title: "Scuba dive with turtles", description: "Get within 1m of these magnificent creatures when you scuba dive with turtles.", user: vendor_1, location: "Nusa Penida", duration: 5, price: 89.99)
listing_1.image.attach(io: image1, filename: 'image1.jpg', content_type: 'image/jpg')
listing_1.save!

image2 = URI.open('https://images.unsplash.com/photo-1597799119438-cbf326f268b9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2833&q=80')
listing_2 = Listing.new(title: "Swim with Nemo", description: "See hundreds of colourful fish on this snorkelling adventure", user: vendor_2, location: "Gili Island", duration: 8, price: 49.99)
listing_2.image.attach(io: image2, filename: 'image2.jpg', content_type: 'image/jpg')
listing_2.save!

image3 = URI.open('https://images.unsplash.com/photo-1610666025104-7ae9de779215?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80')
listing_3 = Listing.new(title: "Surf and swim in Uluwatu", description: "Enjoy the beach and the waves on this surfing adventure", user: vendor_2, location: "Uluwatu", duration: 4, price: 30.50)
listing_3.image.attach(io: image3, filename: 'image3.jpg', content_type: 'image/jpg')
listing_3.save!

listing_slot_1 = ListingSlot.create!(listing: listing_1, start_time: DateTime.parse('10 Sept 2023 09:00:00'), end_time: DateTime.parse('10 Sept 2023 17:00:00'), booked: true)
listing_slot_2 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('11 Sept 2023 09:00:00'), end_time: DateTime.parse('11 Sept 2023 17:00:00'), booked: true)
listing_slot_3 = ListingSlot.create!(listing: listing_1, start_time: DateTime.parse('12 Sept 2023 09:00:00'), end_time: DateTime.parse('12 Sept 2023 17:00:00'), booked: true)
listing_slot_4 = ListingSlot.create!(listing: listing_3, start_time: DateTime.parse('10 Sept 2023 09:00:00'), end_time: DateTime.parse('10 Sept 2023 17:00:00'), booked: true)
listing_slot_5 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('11 Sept 2023 09:00:00'), end_time: DateTime.parse('11 Sept 2023 17:00:00'))
listing_slot_6 = ListingSlot.create!(listing: listing_2, start_time: DateTime.parse('12 Sept 2023 09:00:00'), end_time: DateTime.parse('12 Sept 2023 17:00:00'))

booking_1 = Booking.create!(listing_slot: listing_slot_1, user: client_1)
booking_2 = Booking.create!(listing_slot: listing_slot_2, user: client_1)
booking_3 = Booking.create!(listing_slot: listing_slot_3, user: client_2)
booking_4 = Booking.create!(listing_slot: listing_slot_4, user: client_2)

review_1 = Review.create!(rating: 5, comment: "review comment", listing: listing_1, user: client_1)
review_2 = Review.create!(rating: 3, comment: "where is dory?", listing: listing_2, user: client_1)
