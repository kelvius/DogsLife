# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'net/http'
require 'json'
require 'faker'

FamilyOwnerJoin.destroy_all
Gooddog.destroy_all
Breed.destroy_all
Person.destroy_all
FamilyOwner.destroy_all

# Fethich dog breeds
DOG_API_URL = 'https://dog.ceo/api/breeds/list/all'.freeze

uri = URI(DOG_API_URL)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data['message'].each do |breed, sub_breeds|
  if sub_breeds.empty?
    Breed.create(name: breed)
  else
    sub_breeds.each do |sub_breed|
      Breed.create(name: "#{sub_breed} #{breed}")
    end
  end
end


# Make GET request to the Random User Generator API
uri = URI('https://randomuser.me/api/?results=100')
response = Net::HTTP.get(uri)
data = JSON.parse(response)

# Extract relevant user data and populate the database
data['results'].each do |user|
  name = "#{user['name']['first']}"
  address = "#{user['location']['street']['number']} #{user['location']['street']['name']}"
  latitude = user['location']['coordinates']['latitude']
  longitude = user['location']['coordinates']['longitude']

  Person.create(
    name: name,
    address: address,
    latitude: latitude,
    longitude: longitude
  )
end

# Randomly select breed names from the Breed model
breed_names = Breed.pluck(:name)

200.times do
  breed_name = breed_names.sample

  breed = Breed.find_by(name: breed_name)

  gooddog = Gooddog.create(
    name: Faker::Creature::Dog.name,
    favoritetreat: Faker::Food.dish,
    age: Faker::Number.between(from: 1, to: 15),
    breed: breed
  )
end


# Generate random surnames using Faker
surnames = Array.new(20) { Faker::Name.last_name }

surnames.each do |surname|
  # Create a FamilyOwner with a random surname
  family_owner = FamilyOwner.create(surname: surname)

  # Generate a random number of persons (between 2 and 5)
  num_persons = rand(2..5)

  # Generate a random number of gooddogs (between 1 and 10)
  num_gooddogs = rand(1..10)

  # Retrieve random persons and gooddogs
  persons = Person.order("RANDOM()").limit(num_persons)
  gooddogs = Gooddog.order("RANDOM()").limit(num_gooddogs)

  # Associate persons and gooddogs with the FamilyOwner
  persons.each do |person|
    gooddogs.each do |gooddog|
      FamilyOwnerJoin.create(family_owner: family_owner, person: person, gooddog: gooddog)
    end
  end
end
