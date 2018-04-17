User.destroy_all
Unit.destroy_all
Nutrient.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
NutritionPlan.destroy_all

#units
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

#nutrients
Nutrient.create(name: 'calorie', usda_name: "Energy", nutrient_type: 'macronutrient', usda_unit: 'kcal')
Nutrient.create(name: 'fat', usda_name: "Total lipid (fat)", nutrient_type: 'macronutrient', usda_unit: 'g')
Nutrient.create(name: 'carbohydrate', usda_name: "Carbohydrate, by difference", nutrient_type: 'macronutrient', usda_unit: 'g')
Nutrient.create(name: 'protein', usda_name: "Protein", nutrient_type: 'macronutrient', usda_unit: 'g')
Nutrient.create(name: 'fiber', usda_name: "Fiber, total dietary", nutrient_type: 'macronutrient', usda_unit: 'g')
Nutrient.create(name: 'sugar', usda_name: "Sugars, total", nutrient_type: 'macronutrient', usda_unit: 'g')
Nutrient.create(name: 'saturated fat', usda_name: "Fatty acids, total saturated", nutrient_type: 'macronutrient', usda_unit: 'g')
Nutrient.create(name: 'cholesterol', usda_name: "Cholesterol", nutrient_type: 'macronutrient', usda_unit: 'mg')
Nutrient.create(name: 'calcium', usda_name: "Calcium, Ca", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'iron', usda_name: "Iron, Fe", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'magnesium', usda_name: "Magnesium, Mg", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'phosphorus', usda_name: "Phosphorus, P", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'potassium', usda_name: "Potassium, K", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'sodium', usda_name: "Sodium, Na", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'zinc', usda_name: "Zinc, Zn", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'copper', usda_name: "Copper, Cu", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'manganese', usda_name: "Manganese, Mn", nutrient_type: 'mineral', usda_unit: 'mg')
Nutrient.create(name: 'selenium', usda_name: "Selenium, Se", nutrient_type: 'mineral', usda_unit: 'µg')
Nutrient.create(name: 'vitamin a', usda_name: "Vitamin A, RAE", nutrient_type: 'vitamin', usda_unit: 'µg')
Nutrient.create(name: 'vitamin e', usda_name: "Vitamin E (alpha-tocopherol)", nutrient_type: 'vitamin', usda_unit: 'mg')
Nutrient.create(name: 'vitamin c', usda_name: "Vitamin C, total ascorbic acid", nutrient_type: 'vitamin', usda_unit: 'mg')
Nutrient.create(name: 'thiamin', usda_name: "Thiamin", nutrient_type: 'vitamin', usda_unit: 'mg')
Nutrient.create(name: 'riboflavin', usda_name: "Riboflavin", nutrient_type: 'vitamin', usda_unit: 'mg')
Nutrient.create(name: 'niacin', usda_name: "Niacin", nutrient_type: 'vitamin', usda_unit: 'mg')
Nutrient.create(name: 'vitamin b6', usda_name: "Vitamin B-6", nutrient_type: 'vitamin', usda_unit: 'mg')
Nutrient.create(name: 'vitamin b12', usda_name: "Vitamin B-12", nutrient_type: 'vitamin', usda_unit: 'µg')
Nutrient.create(name: 'choline', usda_name: "Choline, total", nutrient_type: 'vitamin', usda_unit: 'mg')
Nutrient.create(name: 'vitamin k', usda_name: "Vitamin K (phylloquinone)", nutrient_type: 'vitamin', usda_unit: 'µg')
Nutrient.create(name: 'folate', usda_name: "Folate, total", nutrient_type: 'vitamin', usda_unit: 'µg')

#nutrition plans
NutritionPlan.create(
  name: "USDA Dietary Guidelines",
  description: "Reflects the current body of nutrition science and serves as the foundation for nutrition policies and programs across the United States.",
  bucket_by: "gender|age",
  buckets: "female;0..3|male;0..3|female;4..8|male;4..8|female;9..13|male;9..13|female;14..18|male;14..18|female;19..30|male;19..30|female;31..50|male;31..50|female;51..200|male;51..200",
  nutrients: "calorie|fat|carbohydrate|protein|fiber|sugar|saturated fat|cholesterol|calcium|iron|magnesium|phosphorus|potassium|sodium|zinc|copper|manganese|selenium|vitamin a|vitamin e|vitamin c|thiamin|riboflavin|niacin|vitamin b6|vitamin b12|choline|vitamin k|folate",
  recommendation_type: "ul|rda|rda|rda|rda|ul|ul|ul|rda|rda|rda|rda|rda|ul|rda|rda|rda|rda|rda|rda|rda|rda|rda|rda|rda|rda|rda|rda|rda",
  amounts: "1000.0;38.000;130.00;13.000;14.000;25.000;11.000;300.00;700.00;7.0000;80.000;460.00;3000.0;1500.0;3.0000;0.3400;1.2000;20.000;300.00;6.0000;15.000;0.5000;0.5000;6.0000;0.5000;0.9000;200.00;30.000;150.00|1000.0;38.000;130.00;13.000;14.000;25.000;11.000;300.00;700.00;7.0000;80.000;460.00;3000.0;1500.0;3.0000;0.3400;1.2000;20.000;300.00;6.0000;15.000;0.5000;0.5000;6.0000;0.5000;0.9000;200.00;30.000;150.00|1200.0;40.000;130.00;19.000;16.800;30.000;13.000;300.00;1000.0;10.000;130.00;500.0,;3800.0;1900.0;5.0000;0.4400;1.5000;30.000;400.00;7.0000;25.000;0.6000;0.6000;8.0000;0.6000;1.2000;250.00;55.000;200.00|1500.0;50.000;130.00;19.000;19.600;37.000;16.000;300.00;1000.0;10.000;130.00;500.00;3800.0;1900.0;5.0000;0.4400;1.5000;30.000;400.00;7.0000;25.000;0.6000;0.6000;8.0000;0.6000;1.2000;250.00;55.000;200.00|1600.0;53.000;130.00;34.000;22.400;40.000;17.000;300.00;1300.0;8.0000;240.00;1250.0;4500.0;2200.0;8.0000;0.7000;1.6000;40.000;600.00;11.000;45.000;0.9000;0.9000;12.000;1.0000;1.8000;375.00;60.000;300.00|1800.0;60.000;130.00;34.000;25.200;45.000;20.000;300.00;1300.0;8.0000;240.00;1250.0;4500.0;2200.0;8.0000;0.7000;1.9000;40.000;600.00;11.000;45.000;0.9000;0.9000;12.000;1.0000;1.8000;375.00;60.000;300.00|1800.0;60.000;130.00;46.000;25.200;45.000;20.000;300.00;1300.0;15.000;360.00;1250.0;4700.0;2300.0;9.0000;0.8900;1.6000;55.000;700.00;15.000;65.000;1.0000;1.0000;14.000;1.2000;2.4000;400.00;75.000;400.00|2200.0;73.000;130.00;52.000;30.800;55.000;24.000;300.00;1300.0;11.000;410.00;1250.0;4700.0;2300.0;11.000;0.8900;2.2000;55.000;900.00;15.000;75.000;1.2000;1.3000;16.000;1.3000;2.4000;550.00;75.000;400.00|2000.0;61.000;130.00;46.000;28.000;50.000;22.000;300.00;1000.0;18.000;310.00;700.00;4700.0;2300.0;8.0000;0.9000;1.8000;55.000;700.00;15.000;75.000;1.1000;1.1000;14.000;1.3000;2.4000;425.00;90.000;400.00|2400.0;73.000;130.00;56.000;33.600;60.000;26.000;300.00;1000.0;8.0000;400.00;700.00;4700.0;2300.0;11.000;0.9000;2.3000;55.000;900.00;15.000;90.000;1.2000;1.3000;16.000;1.3000;2.4000;550.00;120.00;400.00|1800.0;55.000;130.00;46.000;25.200;45.000;20.000;300.00;1000.0;18.000;320.00;700.00;4700.0;2300.0;8.0000;0.9000;1.8000;55.000;700.00;15.000;75.000;1.1000;1.1000;14.000;1.3000;2.4000;425.00;90.000;400.00|2200.0;67.000;130.00;56.000;30.800;55.000;24.000;300.00;1000.0;8.0000;420.00;700.00;4700.0;2300.0;11.000;0.9000;2.3000;55.000;900.00;15.000;90.000;1.2000;1.3000;16.000;1.3000;2.4000;550.00;120.00;400.00|1600.0;48.000;130.00;46.000;22.400;40.000;17.000;300.00;1200.0;8.0000;320.00;700.00;4700.0;2300.0;8.0000;0.9000;1.8000;55.000;700.00;15.000;75.000;1.1000;1.1000;14.000;1.5000;2.4000;425.00;90.000;400.00|2000.0;61.000;130.00;56.000;28.000;50.000;22.000;300.00;1000.0;8.0000;420.00;700.00;4700.0;2300.0;11.000;0.9000;2.3000;55.000;900.00;15.000;90.000;1.2000;1.3000;16.000;1.7000;2.4000;550.00;120.00;400.00"
)

#users
site_admin = User.create(name: "Site Administrator", email: "admin@nutritiontracker.com", password: 'p@ssw0rd', role: 1, birthday: DateTime.new(1989, 6, 22), gender: 'male', nutrition_plan: NutritionPlan.all[0])

#ingredients
ingredient = Ingredient.find_or_create_by_upc('077901421425')
ingredient.update(name: "Butter: Unsalted")

ingredient = Ingredient.find_or_create_by_upc('049200056752')
ingredient.update(name: "Sugar: Light Brown")

ingredient = Ingredient.find_or_create_by_upc('049200042014')
ingredient.update(name: "Sugar: Granulated")

ingredient = Ingredient.find_or_create_by_upc('815652001141')
ingredient.update(name: "Egg: Whole", density: 1.035)

ingredient = Ingredient.find_or_create_by_upc('071012010509')
ingredient.update(name: "Flour: All-Purpose")

ingredient = Ingredient.find_or_create_by_upc('761720071045')
ingredient.update(name: "Flour: Corn")

ingredient = Ingredient.find_or_create_by_upc('099482427931')
ingredient.update(name: "Baking Soda")

ingredient = Ingredient.find_or_create_by_upc('024600010849')
ingredient.update(name: "Salt: Table")

ingredient = Ingredient.find_or_create_by_upc('747599622137')
ingredient.update(name: "Chocolate: Semisweet", density: 0.8128899183390536)

ingredient = Ingredient.find_or_create_by_upc('093966005851')
ingredient.update(name: "Milk: Whole", density: 1.0310022372748548)

#recipes
recipe = Recipe.new(name: "Control Cookie", user: site_admin)
recipe.recipe_ingredients.build(
  amount_in_recipe: 50,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Butter: Unsalted")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 20.0,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Sugar: Light Brown")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 10.0,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Sugar: Granulated")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 20.0,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Egg: Whole")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 40.0,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Flour: All-Purpose")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.5,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Flour: Corn")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.75,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Baking Soda")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.5,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Salt: Table")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 20.0,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Chocolate: Semisweet")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 236.588,
  user_defined_unit: 'milliliter',
  ingredient: Ingredient.find_by(name: "Milk: Whole")
)
recipe.save
recipe.build_recipe_nutrients

recipe = Recipe.new(name: "Mass Cookie", user: site_admin)
recipe.recipe_ingredients.build(
  amount_in_recipe: 50,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Butter: Unsalted")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 20,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Sugar: Light Brown")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 10,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Sugar: Granulated")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.02,
  user_defined_unit: 'kilogram',
  ingredient: Ingredient.find_by(name: "Egg: Whole")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.0881849768073511,
  user_defined_unit: 'pound',
  ingredient: Ingredient.find_by(name: "Flour: All-Purpose")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 500000.0,
  user_defined_unit: 'microgram',
  ingredient: Ingredient.find_by(name: "Flour: Corn")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 750.0,
  user_defined_unit: 'milligram',
  ingredient: Ingredient.find_by(name: "Baking Soda")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.5,
  user_defined_unit: 'gram',
  ingredient: Ingredient.find_by(name: "Salt: Table")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.7054798144588088,
  user_defined_unit: 'ounce',
  ingredient: Ingredient.find_by(name: "Chocolate: Semisweet")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 8.604129078551063,
  user_defined_unit: 'ounce',
  ingredient: Ingredient.find_by(name: "Milk: Whole")
)
recipe.save
recipe.build_recipe_nutrients

recipe = Recipe.new(name: "Volume Cookie", user: site_admin)
recipe.recipe_ingredients.build(
  amount_in_recipe: 52.81,
  user_defined_unit: 'milliliter',
  ingredient: Ingredient.find_by(name: "Butter: Unsalted")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 5.0,
  user_defined_unit: 'teaspoon',
  ingredient: Ingredient.find_by(name: "Sugar: Light Brown")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.8333310790705223,
  user_defined_unit: 'tablespoon',
  ingredient: Ingredient.find_by(name: "Sugar: Granulated")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.6534117198703077,
  user_defined_unit: 'fluid ounce',
  ingredient: Ingredient.find_by(name: "Egg: Whole")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.3333333333333334,
  user_defined_unit: 'cup',
  ingredient: Ingredient.find_by(name: "Flour: All-Purpose")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.001953131604307911,
  user_defined_unit: 'pint',
  ingredient: Ingredient.find_by(name: "Flour: Corn")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.001627605267384652 ,
  user_defined_unit: 'pint',
  ingredient: Ingredient.find_by(name: "Baking Soda")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.00043402761267025445 ,
  user_defined_unit: 'quart',
  ingredient: Ingredient.find_by(name: "Salt: Table")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.024603577371048253,
  user_defined_unit: 'liter',
  ingredient: Ingredient.find_by(name: "Chocolate: Semisweet")
)
recipe.recipe_ingredients.build(
  amount_in_recipe: 0.06249996697847789,
  user_defined_unit: 'gallon',
  ingredient: Ingredient.find_by(name: "Milk: Whole")
)
recipe.save
recipe.build_recipe_nutrients
