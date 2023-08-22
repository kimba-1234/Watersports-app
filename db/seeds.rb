# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying all seed first"
User.destroy_all
Booking.destroy_all
ListingSlot.destroy_all
Listing.destroy_all
Review.destroy_all

puts "destroy success"

client_1 = User.create!(email: "andrew@email.com", password: "abcd123", first_name: "Andrew", last_name: "Brown",
   phone_number: "+6299900088", user_type: "client", vendor_name: "", vendor_description: "")

vendor_1 = User.create!(email: "philboss@email.com", password: "abc456", first_name: "Phil", last_name: "Boss",
    phone_number: "+621234567", user_type: "vendor", vendor_name: "PhilBoss Scuba Venture", vendor_description: "the best scuba boat trip in Bali")

listing_1 = Listing.create!(title: "Scuba dive with turtles", description: "Itinerary descriptions", user_id: vendor_1.id, location: "Nusa Penida", duration: 5)
listing_2 = Listing.create!(title: "Swim with Nemo", description: "Itinerary descriptions", user_id: vendor_1.id, location: "Gili Island", duration: 5)

listing_slot_1 = ListingSlot.create!(listing: listing_1, start_time: Date.new(2023,2,25), end_time: Date.new(2024,3,25))
listing_slot_2 = ListingSlot.create!(listing: listing_2, start_time: Date.new(2023,4,01), end_time: Date.new(2024,10,01))

booking_1 = Booking.create!(listing_slot: listing_slot_1, user_id: client_1.id)
booking_2 = Booking.create!(listing_slot: listing_slot_2, user_id: client_1.id)

review_1 = Review.create!(rating: 5, comment: "review comment", listing_id: listing_1.id, user_id: client_1.id)
review_2 = Review.create!(rating: 3, comment: "where is dory?", listing_id: listing_2.id, user_id: client_1.id)
