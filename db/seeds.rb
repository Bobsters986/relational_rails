# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Venue.destroy_all
Artist.destroy_all

# Venues:
venue_1 = Venue.create!(decible_limit: true, rank:1, name: "Red Rocks")
venue_2 = Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom")
venue_3 = Venue.create!(decible_limit: false, rank:5, name: "Ball Arena")

# Artists:
artist_1 = Artist.create!(full_band: true, cost: 60, name: "STS9", venue: venue_1)
artist_2 = Artist.create!(full_band: true, cost: 65, name: "Umphrey's McGee", venue: venue_1)
artist_3 = Artist.create!(full_band: true, cost: 55, name: "Brit Floyd", venue: venue_1)
artist_4 = Artist.create!(full_band: false, cost: 63, name: "Pretty Lights", venue: venue_1)

artist_5 = Artist.create!(full_band: true, cost: 70, name: "The String Cheese Incident", venue: venue_2)
artist_6 = Artist.create!(full_band: false, cost: 52, name: "Emancipator", venue: venue_2)
artist_7 = Artist.create!(full_band: true, cost: 75, name: "Billy Strings", venue: venue_2)

artist_8 = Artist.create!(full_band: true, cost: 95, name: "Billy Joel", venue: venue_3)
artist_9 = Artist.create!(full_band: true, cost: 85, name: "The Eagles", venue: venue_3)
artist_10 = Artist.create!(full_band: true, cost: 100, name: "The Rolling Stones", venue: venue_3)