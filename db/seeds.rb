# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Appel la gem faker pour créer des faux profils
require 'faker'

#destroy all data from class
#Affiliation.destroy_all
#Gossip.destroy_all
#User.destroy_all
#City.destroy_all
#Tag.destroy_all

#Création de 10 villes
20.times do
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  );
end

#Création de 10 users liés avec City
20.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(10..99),
    city_id: City.all.sample.id
  );
end


user = User.create!(
  first_name: "anonymous",
  last_name: "anonymous",
  description: "anonymous",
  email: "anonymous",
  age: "anonymous",
  city_id: City.all.sample.id)

#Création de 10 tags
20.times do
  tag = Tag.create!(
    title: Faker::Name.first_name
  );
end

#Création de 20 gossips liés avec User
20.times do
  gossip = Gossip.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
    tag_id: Tag.all.sample.id
  );
end

#Création de la table de jointure avec les gossips et les tags
20.times do
  affiliation = Affiliation.create!(
    gossip_id: Gossip.all.sample.id,
    tag_id: Tag.all.sample.id
  );
end

5.times do
  comment = Comment.create!(
    content: Faker::Quotes::Shakespeare.hamlet_quote,
    user_id: User.all.sample.id,
    gossip_id: Gossip.all.sample.id,
  )
end
