# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all if Rails.env.development?
Ingredient.destroy_all if Rails.env.development?
Dose.destroy_all

require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
ingredients = JSON.parse(json)

ingredients["drinks"].each do |ingredient|
  i = Ingredient.create!(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

gin = Ingredient.new(name: "gin")
whiskey = Ingredient.new(name: "whiskey")
cherry = Ingredient.new(name: "cherry")
cherry_liquor = Ingredient.new(name: "cherry liquor")



av = Cocktail.create!(name: "Aviation")
b = Dose.new(description: "Two parts")
b.cocktail = av
b.ingredient = gin
b.save!

puts "seeds finished"
