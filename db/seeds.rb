require 'open-uri'
require 'json'
Cocktail.destroy_all if Rails.env.development?
Ingredient.destroy_all if Rails.env.development?
Dose.destroy_all if Rails.env.development?

def read_ingredient
  response = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
  json = JSON.parse(response.read)
  new_hash = json['drinks']
  new_hash.each do |item|
    Ingredient.create!(name: item['strIngredient1'])
  end
end

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

Cocktail.create!(name: "Mojito")
Cocktail.create!(name:"Long Island Iced Tea")
Cocktail.create!(name:"Daiquiri")


read_ingredient
