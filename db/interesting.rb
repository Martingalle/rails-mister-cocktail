require_relative 'data_for_seed'

puts "Cleaning database..."

if Rails.env.development?
  Cocktail.destroy_all
  Dose.destroy_all
  Ingredient.destroy_all
end

puts "Now #{Cocktail.all.size} cocktails and #{Ingredient.all.size} ingredients and #{Dose.all.size} doses in database !"

puts "Adding all ingredients from data_for_seed..."

INGREDIENTS.each{ |ingredient| Ingredient.create(name: ingredient)}

puts "Adding random cocktails..."

20.times do
  cocktail = Cocktail.new()
  until cocktail.save
    cocktail = Cocktail.new(name: COCKTAILS.sample)
  end

  4.times do
    dose = Dose.new
    until dose.save
      dose = Dose.new(description: DESCRIPTION.sample,
              cocktail: cocktail,
            ingredient: Ingredient.all.sample
          )
    end
  end
end
puts "Now #{Cocktail.all.size} cocktails and #{Ingredient.all.size} ingredients and #{Dose.all.size} doses in database !"
