#Avant de faire "rails db:seed", run
# rails db:drop
# rails db:create
# rails db:migrate
# sinon il y aura des pb d'indices !

puts "populating db"

puts "First the cocktails..."

cocktails = [
"Godfather",
"Ti’ Punch",
"Nuage noir",
"Hanky Panky",
"Old Cuban",
"Champagne Cocktail",
"Jungle Bird",
"White Russian",
"Vesper",
"Amaretto Sour",
"Painkiller",
"Long Island Iced Tea",
"Vodka Martini",
"Bramble",
"Sidecar",
"Mint Julep",
"Paloma",
"Cuba Libre",
"Americano",
"Cosmopolitan",
"French 75",
"Clover Club",
"Vieux Carre",
"Ramos Gin Fizz",
"Corpse Reviver",
"Caipirinha",
"Tom Collins",
"Gin Fizz",
"Aperol Spritz",
"Rum Old Fashioned",
"Zombie",
"Penicillin",
"Pisco Sour",
"Aviation",
"Gimlet",
"Espresso Martini",
"Dark ’N’ Stormy",
"Boulevardier",
"Mai Tai",
"Bloody Mary",
"Sazerac",
"Mojito",
"Moscow Mule",
"Margarita",
"Dry Martini",
"Whiskey Sour",
"Manhattan",
"Daiquiri",
"Negroni",
"Old Fashioned"
]

for i in (0..cocktails.length)
 Cocktail.create(name: cocktails[i])
end
puts "Cocktails done !"
puts "Now the ingredients !"

ingredients = [
"Lemon",
"Ice",
"Mint Leaves",
"Orange",
"Rhum",
"Vodka",
"Gingembre",
"Cucumber",
"Strawberry",
"Green Olive",
"Coffee",
"Black Olive",
"White wine",
"Red wine",
"Paprika",
"Salt",
"Pepper",
"Blackberry",
"Love",
"Fresh water",
"Banana"
]

for i in (0..ingredients.length)
 Ingredient.create(name: ingredients[i])
end

puts "Ingredients generated !"
puts "Now the Doses !"

description = [
  "with lots of love",
  "10 cl",
  "2 spoonfull",
  "1 good liter",
  "not too much",
  "as much as you like",
  "one handfull",
  "half of the glass",
  "just a tad",
  "to enhance the taste",
  "you could add fresh mint with that",
  "but dont tell anyone",
]

# j'itère sur chaque cocktail (50 cocktails)
for n in (1..50)
  tableau = (1..20).to_a
  # je mets entre 2 et 5 ingredients par cocktail
  for i in (1..rand(3..5))
    #je choisis un index pour l'ingredient_id dans un tableau de 20 choix (=20 ingrédients)
    g = tableau.sample
    #je vire l'index du tableau pour ne jamais reprendre le même ingredient (pairs unique)
    tableau.delete_at(g-1)
    #je créela Dose pour le cocktail n et l'ingredient_id g
    Dose.create(description: description[rand(1..10)], cocktail_id: n, ingredient_id: g)
  end
end

puts "Doses are done !"
puts "Finally the reviews !"

note = [0, 1, 2, 3, 4, 5]

comment = {
  "0" => ["Horrible", "moche", "disgusting"],
  "1" => ["no", "not really a cocktail", "what the fuck was in this cocktail ?"],
  "2" => ["tasted like water", "Orangina tastes better", "nice try"],
  "3" => ["average plus", "hmm that was a nice start", "like an old friend"],
  "4" => ["waouw that was good ", "A great way to start the night", "i could become addicted"],
  "5" => ["Heaven on earth in a glass", "I could not believe it", "Best cocktail ever, they should make fountains out of it"],
}

#j'itère sur chaque cocktail
for i in (1..50)
  #je mets entre 0 et 10 reviews sur chaque cocktails
  rand(0..10).times do
    rating = note.sample
    review = Review.create(
      rating: rating,
      description: comment[rating.to_s].sample,
      cocktail_id: i
      )
  end
end

puts "Reviews done !"

puts "your database has been populated, now you can play"
