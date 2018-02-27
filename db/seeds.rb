# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = '123'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.unique.email
    user['gender'] = rand(1..2)
    user['country'] = Faker::Address.country
    user['birthday'] = Faker::Date.between(50.years.ago, 20.years.ago)

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  120.times do 
    listing['name'] = Faker::App.name
    listing['property_type'] = ["house", "condominium","townhouse", "treehouse", "chalet", "room","apartment"].sample

    listing['room_number'] = rand(0..5)
    listing['bed_number'] = rand(1..6)
    listing['guest_number'] = rand(1..10)

    listing['country'] = Faker::Address.country
    listing['state'] = Faker::Address.state
    listing['city'] = Faker::Address.city
    listing['postcode'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address

    listing['price'] = rand(80..500)
    listing['amenities'] = ["kitchen","pool","gym","toilet","bathtub","balcony"].sample
    listing['tags']=[]

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end