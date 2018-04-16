User.destroy_all
Unit.destroy_all
Nutrient.destroy_all
Ingredient.destroy_all
Recipe.destroy_all

#users
site_admin = User.create(name: "Site Administrator", email: "admin@nutritiontracker.com", password: 'p@ssw0rd', role: 1, birthday: DateTime.new(1989, 6, 22), gender: 'M')

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
Nutrient.create(name: 'calorie',usda_name: "Energy",nutrient_type:'macronutrient',usda_unit:'kcal',recommendation_type:'need',recommendation_amount_I: 1000.0,recommendation_amount_FC: 1200.0,recommendation_amount_MC: 1500.0,recommendation_amount_FP:1600.0,recommendation_amount_MP: 1800.0,recommendation_amount_FT:1800.0,recommendation_amount_MT: 2200.0,recommendation_amount_FY: 2000.0,recommendation_amount_MY: 2400.0,recommendation_amount_FA: 1800.0,recommendation_amount_MA: 2200.0,recommendation_amount_FE: 1600.0,recommendation_amount_ME: 2000.0)

Nutrient.create(name: 'fat',usda_name: "Total lipid (fat)",nutrient_type:'macronutrient',usda_unit:'g',recommendation_type:'need',recommendation_amount_I: 38.0,recommendation_amount_FC: 40.000,recommendation_amount_MC: 50.0,recommendation_amount_FP:53.000,recommendation_amount_MP: 60.000,recommendation_amount_FT:60.000,recommendation_amount_MT: 73.000,recommendation_amount_FY: 61.000,recommendation_amount_MY: 73.000,recommendation_amount_FA: 55.000,recommendation_amount_MA: 67.000,recommendation_amount_FE: 48.000,recommendation_amount_ME: 61.000)

Nutrient.create(name: 'carbohydrate',usda_name: "Carbohydrate, by difference",nutrient_type:'macronutrient',usda_unit:'g',recommendation_type:'need',recommendation_amount_I: 130.0,recommendation_amount_FC: 130.00,recommendation_amount_MC: 130.0,recommendation_amount_FP:130.00,recommendation_amount_MP: 130.00,recommendation_amount_FT:130.00,recommendation_amount_MT: 130.00,recommendation_amount_FY: 130.00,recommendation_amount_MY: 130.00,recommendation_amount_FA: 130.00,recommendation_amount_MA: 130.00,recommendation_amount_FE: 130.00,recommendation_amount_ME: 130.00)

Nutrient.create(name: 'protein',usda_name: "Protein",nutrient_type:'macronutrient',usda_unit:'g',recommendation_type:'need',recommendation_amount_I: 13.0,recommendation_amount_FC: 19.000,recommendation_amount_MC: 19.0,recommendation_amount_FP:34.000,recommendation_amount_MP: 34.000,recommendation_amount_FT:46.000,recommendation_amount_MT: 52.000,recommendation_amount_FY: 46.000,recommendation_amount_MY: 56.000,recommendation_amount_FA: 46.000,recommendation_amount_MA: 56.000,recommendation_amount_FE: 46.000,recommendation_amount_ME: 56.000)

Nutrient.create(name: 'fiber',usda_name: "Fiber, total dietary",nutrient_type:'macronutrient',usda_unit:'g',recommendation_type:'need',recommendation_amount_I: 14.0,recommendation_amount_FC: 16.800,recommendation_amount_MC: 19.6,recommendation_amount_FP:22.400,recommendation_amount_MP: 25.200,recommendation_amount_FT:25.200,recommendation_amount_MT: 30.800,recommendation_amount_FY: 28.000,recommendation_amount_MY: 33.600,recommendation_amount_FA: 25.200,recommendation_amount_MA: 30.800,recommendation_amount_FE: 22.400,recommendation_amount_ME: 28.000)

Nutrient.create(name: 'sugar',usda_name: "Sugars, total",nutrient_type:'macronutrient',usda_unit:'g',recommendation_type:'limit',recommendation_amount_I: 25.0,recommendation_amount_FC: 30.000,recommendation_amount_MC: 37.0,recommendation_amount_FP:40.000,recommendation_amount_MP: 45.000,recommendation_amount_FT:45.000,recommendation_amount_MT: 55.000,recommendation_amount_FY: 50.000,recommendation_amount_MY: 60.000,recommendation_amount_FA: 45.000,recommendation_amount_MA: 55.000,recommendation_amount_FE: 40.000,recommendation_amount_ME: 50.000)

Nutrient.create(name: 'saturated fat',usda_name: "Fatty acids, total saturated",nutrient_type:'macronutrient',usda_unit:'g',recommendation_type:'limit',recommendation_amount_I: 11.0,recommendation_amount_FC: 13.000,recommendation_amount_MC: 16.0,recommendation_amount_FP:17.000,recommendation_amount_MP: 20.000,recommendation_amount_FT:20.000,recommendation_amount_MT: 24.000,recommendation_amount_FY: 22.000,recommendation_amount_MY: 26.000,recommendation_amount_FA: 20.000,recommendation_amount_MA: 24.000,recommendation_amount_FE: 17.000,recommendation_amount_ME: 22.000)

Nutrient.create(name: 'cholesterol',usda_name: "Cholesterol",nutrient_type:'macronutrient',usda_unit:'mg',recommendation_type:'limit',recommendation_amount_I: 300.0,recommendation_amount_FC: 300.00,recommendation_amount_MC: 300.0,recommendation_amount_FP:300.00,recommendation_amount_MP: 300.00,recommendation_amount_FT:300.00,recommendation_amount_MT: 300.00,recommendation_amount_FY: 300.00,recommendation_amount_MY: 300.00,recommendation_amount_FA: 300.00,recommendation_amount_MA: 300.00,recommendation_amount_FE: 300.00,recommendation_amount_ME: 300.00)

Nutrient.create(name: 'calcium',usda_name: "Calcium, Ca",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 700.0,recommendation_amount_FC: 1000.0,recommendation_amount_MC: 1000.0,recommendation_amount_FP:1300.0,recommendation_amount_MP: 1300.0,recommendation_amount_FT:1300.0,recommendation_amount_MT: 1300.0,recommendation_amount_FY: 1000.0,recommendation_amount_MY: 1000.0,recommendation_amount_FA: 1000.0,recommendation_amount_MA: 1000.0,recommendation_amount_FE: 1200.0,recommendation_amount_ME: 1000.0)

Nutrient.create(name: 'iron',usda_name: "Iron, Fe",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 7.0,recommendation_amount_FC: 10.000,recommendation_amount_MC: 10.0,recommendation_amount_FP:8.0000,recommendation_amount_MP: 8.0000,recommendation_amount_FT:15.000,recommendation_amount_MT: 11.000,recommendation_amount_FY: 18.000,recommendation_amount_MY: 8.0000,recommendation_amount_FA: 18.000,recommendation_amount_MA: 8.0000,recommendation_amount_FE: 8.0000,recommendation_amount_ME: 8.0000)

Nutrient.create(name: 'magnesium',usda_name: "Magnesium, Mg",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 80.0,recommendation_amount_FC: 130.00,recommendation_amount_MC: 130.0,recommendation_amount_FP:240.00,recommendation_amount_MP: 240.00,recommendation_amount_FT:360.00,recommendation_amount_MT: 410.00,recommendation_amount_FY: 310.00,recommendation_amount_MY: 400.00,recommendation_amount_FA: 320.00,recommendation_amount_MA: 420.00,recommendation_amount_FE: 320.00,recommendation_amount_ME: 420.00)

Nutrient.create(name: 'phosphorus',usda_name: "Phosphorus, P",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 460.0,recommendation_amount_FC: 500.0,recommendation_amount_MC: 500.0,recommendation_amount_FP:1250.0,recommendation_amount_MP: 1250.0,recommendation_amount_FT:1250.0,recommendation_amount_MT: 1250.0,recommendation_amount_FY: 700.0,recommendation_amount_MY: 700.0,recommendation_amount_FA: 700.0,recommendation_amount_MA: 700.0,recommendation_amount_FE: 700.0,recommendation_amount_ME: 700.0)

Nutrient.create(name: 'potassium',usda_name: "Potassium, K",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 3000.0,recommendation_amount_FC: 3800.0,recommendation_amount_MC: 3800.0,recommendation_amount_FP:4500.0,recommendation_amount_MP: 4500.0,recommendation_amount_FT:4700.0,recommendation_amount_MT: 4700.0,recommendation_amount_FY: 4700.0,recommendation_amount_MY: 4700.0,recommendation_amount_FA: 4700.0,recommendation_amount_MA: 4700.0,recommendation_amount_FE: 4700.0,recommendation_amount_ME: 4700.0)

Nutrient.create(name: 'sodium',usda_name: "Sodium, Na",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'limit',recommendation_amount_I: 1500.0,recommendation_amount_FC: 1900.0,recommendation_amount_MC: 1900.0,recommendation_amount_FP:2200.0,recommendation_amount_MP: 2200.0,recommendation_amount_FT:2300.0,recommendation_amount_MT: 2300.0,recommendation_amount_FY: 2300.0,recommendation_amount_MY: 2300.0,recommendation_amount_FA: 2300.0,recommendation_amount_MA: 2300.0,recommendation_amount_FE: 2300.0,recommendation_amount_ME: 2300.0)

Nutrient.create(name: 'zinc',usda_name: "Zinc, Zn",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 3.0,recommendation_amount_FC: 5.0000,recommendation_amount_MC: 5.0,recommendation_amount_FP:8.0000,recommendation_amount_MP: 8.0000,recommendation_amount_FT:9.0000,recommendation_amount_MT: 11.000,recommendation_amount_FY: 8.0000,recommendation_amount_MY: 11.000,recommendation_amount_FA: 8.0000,recommendation_amount_MA: 11.000,recommendation_amount_FE: 8.0000,recommendation_amount_ME: 11.000)

Nutrient.create(name: 'copper',usda_name: "Copper, Cu",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 0.3400,recommendation_amount_FC: 0.4400,recommendation_amount_MC: 0.4400,recommendation_amount_FP:0.7000,recommendation_amount_MP: 0.7000,recommendation_amount_FT:0.8900,recommendation_amount_MT: 0.8900,recommendation_amount_FY: 0.9000,recommendation_amount_MY: 0.9000,recommendation_amount_FA: 0.9000,recommendation_amount_MA:0.9000,recommendation_amount_FE: 0.9000,recommendation_amount_ME: 0.9000)

Nutrient.create(name: 'manganese',usda_name: "Manganese, Mn",nutrient_type:'mineral',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 1.2,recommendation_amount_FC: 1.5000,recommendation_amount_MC: 1.5,recommendation_amount_FP:1.6000,recommendation_amount_MP: 1.9000,recommendation_amount_FT:1.6000,recommendation_amount_MT: 2.2000,recommendation_amount_FY: 1.8000,recommendation_amount_MY: 2.3000,recommendation_amount_FA: 1.8000,recommendation_amount_MA: 2.3000,recommendation_amount_FE: 1.8000,recommendation_amount_ME: 2.3000)

Nutrient.create(name: 'selenium',usda_name: "Selenium, Se",nutrient_type:'mineral',usda_unit:'µg',recommendation_type:'need',recommendation_amount_I: 20.0,recommendation_amount_FC: 30.000,recommendation_amount_MC: 30.0,recommendation_amount_FP:40.000,recommendation_amount_MP: 40.000,recommendation_amount_FT:55.000,recommendation_amount_MT: 55.000,recommendation_amount_FY: 55.000,recommendation_amount_MY: 55.000,recommendation_amount_FA: 55.000,recommendation_amount_MA: 55.000,recommendation_amount_FE: 55.000,recommendation_amount_ME: 55.000)

Nutrient.create(name: 'vitamin a',usda_name: "Vitamin A, RAE",nutrient_type:'vitamin',usda_unit:'µg',recommendation_type:'need',recommendation_amount_I: 300.0,recommendation_amount_FC: 400.00,recommendation_amount_MC: 400.0,recommendation_amount_FP:600.00,recommendation_amount_MP: 600.00,recommendation_amount_FT:700.00,recommendation_amount_MT: 900.00,recommendation_amount_FY: 700.00,recommendation_amount_MY: 900.00,recommendation_amount_FA: 700.00,recommendation_amount_MA: 900.00,recommendation_amount_FE: 700.00,recommendation_amount_ME: 900.00)

Nutrient.create(name: 'vitamin e',usda_name: "Vitamin E (alpha-tocopherol)",nutrient_type:'vitamin',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 6.0,recommendation_amount_FC: 7.0000,recommendation_amount_MC: 7.0,recommendation_amount_FP:11.000,recommendation_amount_MP: 11.000,recommendation_amount_FT:15.000,recommendation_amount_MT: 15.000,recommendation_amount_FY: 15.000,recommendation_amount_MY: 15.000,recommendation_amount_FA: 15.000,recommendation_amount_MA: 15.000,recommendation_amount_FE: 15.000,recommendation_amount_ME: 15.000)

Nutrient.create(name: 'vitamin c',usda_name: "Vitamin C, total ascorbic acid",nutrient_type:'vitamin',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 15.0,recommendation_amount_FC: 25.000,recommendation_amount_MC: 25.0,recommendation_amount_FP:45.000,recommendation_amount_MP: 45.000,recommendation_amount_FT:65.000,recommendation_amount_MT: 75.000,recommendation_amount_FY: 75.000,recommendation_amount_MY: 90.000,recommendation_amount_FA: 75.000,recommendation_amount_MA: 90.000,recommendation_amount_FE: 75.000,recommendation_amount_ME: 90.000)

Nutrient.create(name: 'thiamin',usda_name: "Thiamin",nutrient_type:'vitamin',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 0.5,recommendation_amount_FC: 0.6000,recommendation_amount_MC: 0.6,recommendation_amount_FP:0.9000,recommendation_amount_MP: 0.9000,recommendation_amount_FT:1.0000,recommendation_amount_MT: 1.2000,recommendation_amount_FY: 1.1000,recommendation_amount_MY: 1.2000,recommendation_amount_FA: 1.1000,recommendation_amount_MA: 1.2000,recommendation_amount_FE: 1.1000,recommendation_amount_ME: 1.2000)

Nutrient.create(name: 'riboflavin',usda_name: "Riboflavin",nutrient_type:'vitamin',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 0.5,recommendation_amount_FC: 0.6000,recommendation_amount_MC: 0.6,recommendation_amount_FP:0.9000,recommendation_amount_MP: 0.9000,recommendation_amount_FT:1.0000,recommendation_amount_MT: 1.3000,recommendation_amount_FY: 1.1000,recommendation_amount_MY: 1.3000,recommendation_amount_FA: 1.1000,recommendation_amount_MA: 1.3000,recommendation_amount_FE: 1.1000,recommendation_amount_ME: 1.3000)

Nutrient.create(name: 'niacin',usda_name: "Niacin",nutrient_type:'vitamin',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 6.0,recommendation_amount_FC: 8.0000,recommendation_amount_MC: 8.0,recommendation_amount_FP:12.000,recommendation_amount_MP: 12.000,recommendation_amount_FT:14.000,recommendation_amount_MT: 16.000,recommendation_amount_FY: 14.000,recommendation_amount_MY: 16.000,recommendation_amount_FA: 14.000,recommendation_amount_MA: 16.000,recommendation_amount_FE: 14.000,recommendation_amount_ME: 16.000)

Nutrient.create(name: 'vitamin b6',usda_name: "Vitamin B-6",nutrient_type:'vitamin',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 0.5,recommendation_amount_FC: 0.6000,recommendation_amount_MC: 0.6,recommendation_amount_FP:1.0000,recommendation_amount_MP: 1.0000,recommendation_amount_FT:1.2000,recommendation_amount_MT: 1.3000,recommendation_amount_FY: 1.3000,recommendation_amount_MY: 1.3000,recommendation_amount_FA: 1.3000,recommendation_amount_MA: 1.3000,recommendation_amount_FE: 1.5000,recommendation_amount_ME: 1.7000)

Nutrient.create(name: 'vitamin b12',usda_name: "Vitamin B-12",nutrient_type:'vitamin',usda_unit:'µg',recommendation_type:'need',recommendation_amount_I: 0.9,recommendation_amount_FC: 1.2000,recommendation_amount_MC: 1.2,recommendation_amount_FP:1.8000,recommendation_amount_MP: 1.8000,recommendation_amount_FT:2.4000,recommendation_amount_MT: 2.4000,recommendation_amount_FY: 2.4000,recommendation_amount_MY: 2.4000,recommendation_amount_FA: 2.4000,recommendation_amount_MA: 2.4000,recommendation_amount_FE: 2.4000,recommendation_amount_ME: 2.4000)

Nutrient.create(name: 'choline',usda_name: "Choline, total",nutrient_type:'vitamin',usda_unit:'mg',recommendation_type:'need',recommendation_amount_I: 200.0,recommendation_amount_FC: 250.00,recommendation_amount_MC: 250.0,recommendation_amount_FP:375.00,recommendation_amount_MP: 375.00,recommendation_amount_FT:400.00,recommendation_amount_MT: 550.00,recommendation_amount_FY: 425.00,recommendation_amount_MY: 550.00,recommendation_amount_FA: 425.00,recommendation_amount_MA: 550.00,recommendation_amount_FE: 425.00,recommendation_amount_ME: 550.00)

Nutrient.create(name: 'vitamin k',usda_name: "Vitamin K (phylloquinone)",nutrient_type:'vitamin',usda_unit:'µg',recommendation_type:'need',recommendation_amount_I: 30.0,recommendation_amount_FC: 55.000,recommendation_amount_MC: 55.0,recommendation_amount_FP:60.000,recommendation_amount_MP: 60.000,recommendation_amount_FT:75.000,recommendation_amount_MT: 75.000,recommendation_amount_FY: 90.000,recommendation_amount_MY: 120.00,recommendation_amount_FA: 90.000,recommendation_amount_MA: 120.00,recommendation_amount_FE: 90.000,recommendation_amount_ME: 120.00)

Nutrient.create(name: 'folate',usda_name: "Folate, total",nutrient_type:'vitamin',usda_unit:'µg',recommendation_type:'need',recommendation_amount_I: 150.0,recommendation_amount_FC: 200.00,recommendation_amount_MC: 200.0,recommendation_amount_FP:300.00,recommendation_amount_MP: 300.00,recommendation_amount_FT:400.00,recommendation_amount_MT: 400.00,recommendation_amount_FY: 400.00,recommendation_amount_MY: 400.00,recommendation_amount_FA: 400.00,recommendation_amount_MA: 400.00,recommendation_amount_FE: 400.00,recommendation_amount_ME: 400.00)


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
