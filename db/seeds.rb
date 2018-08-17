puts "destroying existing"
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

puts "population db"

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "orange")
Ingredient.create(name: "rhum")

Cocktail.create(name: "Mojito")
Cocktail.create(name: "Sex on the beach")
Cocktail.create(name: "Nuage Noir")
Cocktail.create(name: "Daikiri")
Cocktail.create(name: "Ti'Punch")

Dose.create(amount: 6, description: "y aller doucement", cocktail_id: 12, ingredient_id: 11)
Dose.create(amount: 8, description: "verser avec précaution", cocktail_id: 12, ingredient_id: 12)
Dose.create(amount: 4, description: "d'un coup", cocktail_id: 12, ingredient_id: 13)
Dose.create(amount: 8, description: "2 lignes seulement", cocktail_id: 12, ingredient_id: 14)
Dose.create(amount: 1, description: "avec la petite cuillière", cocktail_id: 12, ingredient_id: 15)

puts "done ! get back to work !"

