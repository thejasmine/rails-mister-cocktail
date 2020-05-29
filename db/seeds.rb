require 'open-uri'
require 'json'
Cocktail.destroy_all if Rails.env.development?
Ingredient.destroy_all if Rails.env.development?
Dose.destroy_all if Rails.env.development?

list = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
def fetch(url)
  data_serialized = open(url).read
  return JSON.parse(data_serialized)
end
cocktails = fetch(list)
cocktails.each do |cocktail|
  c = Cocktail.create!(name: cocktail['name'],preparation: cocktail['preparation'])
  cocktail['ingredients'].each do |ingredient|
    i = Ingredient.find_or_create_by(
    name: ingredient['ingredient'])
    d = Dose.create(cocktail: c, ingredient: i, description: "#{ingredient['amount'.to_s]} #{ingredient['unit']}")
  end
end
