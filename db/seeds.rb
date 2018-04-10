IngredientAmount.destroy_all

#units
Unit.destroy_all
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 1.000000, name: 'milliliter', abbreviation: 'ml')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 4.928920, name: 'teaspoon', abbreviation: 'tsp')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 14.78680, name: 'tablespoon', abbreviation: 'Tbsp')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 29.57350, name: 'fluid ounce', abbreviation: 'fl oz')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 236.5880, name: 'cup', abbreviation: 'c')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 473.1760, name: 'pint', abbreviation: 'pt')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 946.3530, name: 'quart', abbreviation: 'qt')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 1000.000, name: 'liter', abbreviation: 'l')
Unit.create(physical_property: 'volume', lowest_unit: 'milliliter', lowest_unit_equivalence: 3785.410, name: 'gallon', abbreviation: 'gal')
Unit.create(physical_property: 'mass', lowest_unit: 'gram', lowest_unit_equivalence: 0.000001, name: 'microgram', abbreviation: 'µg')
Unit.create(physical_property: 'mass', lowest_unit: 'gram', lowest_unit_equivalence: 0.001000, name: 'milligram', abbreviation: 'mg')
Unit.create(physical_property: 'mass', lowest_unit: 'gram', lowest_unit_equivalence: 1.000000, name: 'gram', abbreviation: 'g')
Unit.create(physical_property: 'mass', lowest_unit: 'gram', lowest_unit_equivalence: 28.34950, name: 'ounce', abbreviation: 'oz')
Unit.create(physical_property: 'mass', lowest_unit: 'gram', lowest_unit_equivalence: 453.5920, name: 'pound', abbreviation: 'lb')
Unit.create(physical_property: 'mass', lowest_unit: 'gram', lowest_unit_equivalence: 1000.000, name: 'kilogram', abbreviation: 'kg')

#ingredients
Ingredient.destroy_all
ingredient = Ingredient.find_or_create_by_upc('077901421425')
ingredient.update(name: "Butter: Unsalted")

ingredient = Ingredient.find_or_create_by_upc('049200056752')
ingredient.update(name: "Sugar: Light Brown")

ingredient = Ingredient.find_or_create_by_upc('049200042014')
ingredient.update(name: "Sugar: Granulated")

ingredient = Ingredient.find_or_create_by_upc('815652001141')
ingredient.update(name: "Egg: Whole")
# , density: 1.035)

ingredient = Ingredient.find_or_create_by_upc('071012010509')
ingredient.update(name: "Flour: All-Purpose")

ingredient = Ingredient.find_or_create_by_upc('761720071045')
ingredient.update(name: "Flour: Corn")

ingredient = Ingredient.find_or_create_by_upc('099482427931')
ingredient.update(name: "Baking Soda")

ingredient = Ingredient.find_or_create_by_upc('024600010849')
ingredient.update(name: "Salt: Table")

ingredient = Ingredient.find_or_create_by_upc('747599622137')
ingredient.update(name: "Chocolate: Semisweet")
# , density: 0.8128899183390536)

ingredient = Ingredient.find_or_create_by_upc('093966005851')
ingredient.update(name: "Milk: Whole")
# , density: 1.0310022372748548)

#recipes
Recipe.destroy_all
recipe = Recipe.new(name: "Whopper Cookie")

recipe.ingredient_amounts.build(
  amount: 50,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Butter: Unsalted")
)
recipe.ingredient_amounts.build(
  amount: 20,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Sugar: Light Brown")
)
recipe.ingredient_amounts.build(
  amount: 10,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Sugar: Granulated")
)
recipe.ingredient_amounts.build(
  amount: 20,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Egg: Whole")
)
recipe.ingredient_amounts.build(
  amount: 40,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Flour: All-Purpose")
)
recipe.ingredient_amounts.build(
  amount: 0.5,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Flour: Corn")
)
recipe.ingredient_amounts.build(
  amount: 0.75,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Baking Soda")
)
recipe.ingredient_amounts.build(
  amount: 0.5,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Salt: Table")
)
recipe.ingredient_amounts.build(
  amount: 20,
  unit: Unit.find_by(name: "gram"),
  ingredient: Ingredient.find_by(name: "Chocolate: Semisweet")
)
recipe.ingredient_amounts.build(
  amount: 1,
  unit: Unit.find_by(name: "cup"),
  ingredient: Ingredient.find_by(name: "Milk: Whole")
)
recipe.save
recipe.populate_nutrition
