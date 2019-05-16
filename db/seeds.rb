# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
ingredients = JSON.parse(json)

ingredient_list = ingredients["drinks"].each do |h|
  Ingredient.create!(h["strIngredient1"])
end



av = Cocktail.create!(name: "Aviation")
Dose.create!(cocktail_id = av.id, ingredient_id = gin.id, description = "Two parts")
Dose.create!(cocktail_id = av.id, ingredient_id = whiskey.id, description = "Two parts")
Dose.create!(cocktail_id = av.id, ingredient_id = cherry.id, description = "One")


man = Cocktail.create!(name: "Manhattan")
Dose.create!(cocktail_id = man.id, ingredient_id = ingredient.id, description = "Two parts")
Dose.create!(cocktail_id = man.id, ingredient_id = whiskey.id, description = "Three parts")
Dose.create!(cocktail_id = man.id, ingredient_id = cherry_liquor.id, description = "One")
