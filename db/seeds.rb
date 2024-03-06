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

Breed.destroy_all

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
