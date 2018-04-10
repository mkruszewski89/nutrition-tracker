# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180410133505) do

  create_table "ingredient_amounts", force: :cascade do |t|
    t.float "amount", default: 0.0
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", default: ""
    t.string "ndbno", default: ""
    t.string "upc", default: ""
    t.float "density", default: 0.0
    t.string "usda_unit", default: ""
    t.float "cholesterol_per_usda_unit", default: 0.0
    t.string "cholesterol_unit", default: ""
    t.float "calorie_per_usda_unit", default: 0.0
    t.string "calorie_unit", default: ""
    t.float "protein_per_usda_unit", default: 0.0
    t.string "protein_unit", default: ""
    t.float "carbohydrate_per_usda_unit", default: 0.0
    t.string "carbohydrate_unit", default: ""
    t.float "fiber_per_usda_unit", default: 0.0
    t.string "fiber_unit", default: ""
    t.float "sugar_per_usda_unit", default: 0.0
    t.string "sugar_unit", default: ""
    t.float "fat_total_per_usda_unit", default: 0.0
    t.string "fat_total_unit", default: ""
    t.float "fat_saturated_per_usda_unit", default: 0.0
    t.string "fat_saturated_unit", default: ""
    t.float "calcium_per_usda_unit", default: 0.0
    t.string "calcium_unit", default: ""
    t.float "iron_per_usda_unit", default: 0.0
    t.string "iron_unit", default: ""
    t.float "magnesium_per_usda_unit", default: 0.0
    t.string "magnesium_unit", default: ""
    t.float "phosphorus_per_usda_unit", default: 0.0
    t.string "phosphorus_unit", default: ""
    t.float "potassium_per_usda_unit", default: 0.0
    t.string "potassium_unit", default: ""
    t.float "sodium_per_usda_unit", default: 0.0
    t.string "sodium_unit", default: ""
    t.float "zinc_per_usda_unit", default: 0.0
    t.string "zinc_unit", default: ""
    t.float "copper_per_usda_unit", default: 0.0
    t.string "copper_unit", default: ""
    t.float "manganese_per_usda_unit", default: 0.0
    t.string "manganese_unit", default: ""
    t.float "selenium_per_usda_unit", default: 0.0
    t.string "selenium_unit", default: ""
    t.float "vitamin_a_per_usda_unit", default: 0.0
    t.string "vitamin_a_unit", default: ""
    t.float "vitamin_e_per_usda_unit", default: 0.0
    t.string "vitamin_e_unit", default: ""
    t.float "vitamin_c_per_usda_unit", default: 0.0
    t.string "vitamin_c_unit", default: ""
    t.float "thiamin_per_usda_unit", default: 0.0
    t.string "thiamin_unit", default: ""
    t.float "riboflavin_per_usda_unit", default: 0.0
    t.string "riboflavin_unit", default: ""
    t.float "niacin_per_usda_unit", default: 0.0
    t.string "niacin_unit", default: ""
    t.float "vitamin_b6_per_usda_unit", default: 0.0
    t.string "vitamin_b6_unit", default: ""
    t.float "vitamin_b12_per_usda_unit", default: 0.0
    t.string "vitamin_b12_unit", default: ""
    t.float "choline_per_usda_unit", default: 0.0
    t.string "choline_unit", default: ""
    t.float "vitamin_k_per_usda_unit", default: 0.0
    t.string "vitamin_k_unit", default: ""
    t.float "folate_per_usda_unit", default: 0.0
    t.string "folate_unit", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", default: ""
    t.float "cholesterol", default: 0.0
    t.string "cholesterol_unit", default: ""
    t.float "calorie", default: 0.0
    t.string "calorie_unit", default: ""
    t.float "protein", default: 0.0
    t.string "protein_unit", default: ""
    t.float "carbohydrate", default: 0.0
    t.string "carbohydrate_unit", default: ""
    t.float "fiber", default: 0.0
    t.string "fiber_unit", default: ""
    t.float "sugar", default: 0.0
    t.string "sugar_unit", default: ""
    t.float "fat_total", default: 0.0
    t.string "fat_total_unit", default: ""
    t.float "fat_saturated", default: 0.0
    t.string "fat_saturated_unit", default: ""
    t.float "calcium", default: 0.0
    t.string "calcium_unit", default: ""
    t.float "iron", default: 0.0
    t.string "iron_unit", default: ""
    t.float "magnesium", default: 0.0
    t.string "magnesium_unit", default: ""
    t.float "phosphorus", default: 0.0
    t.string "phosphorus_unit", default: ""
    t.float "potassium", default: 0.0
    t.string "potassium_unit", default: ""
    t.float "sodium", default: 0.0
    t.string "sodium_unit", default: ""
    t.float "zinc", default: 0.0
    t.string "zinc_unit", default: ""
    t.float "copper", default: 0.0
    t.string "copper_unit", default: ""
    t.float "manganese", default: 0.0
    t.string "manganese_unit", default: ""
    t.float "selenium", default: 0.0
    t.string "selenium_unit", default: ""
    t.float "vitamin_a", default: 0.0
    t.string "vitamin_a_unit", default: ""
    t.float "vitamin_e", default: 0.0
    t.string "vitamin_e_unit", default: ""
    t.float "vitamin_c", default: 0.0
    t.string "vitamin_c_unit", default: ""
    t.float "thiamin", default: 0.0
    t.string "thiamin_unit", default: ""
    t.float "riboflavin", default: 0.0
    t.string "riboflavin_unit", default: ""
    t.float "niacin", default: 0.0
    t.string "niacin_unit", default: ""
    t.float "vitamin_b6", default: 0.0
    t.string "vitamin_b6_unit", default: ""
    t.float "vitamin_b12", default: 0.0
    t.string "vitamin_b12_unit", default: ""
    t.float "choline", default: 0.0
    t.string "choline_unit", default: ""
    t.float "vitamin_k", default: 0.0
    t.string "vitamin_k_unit", default: ""
    t.float "folate", default: 0.0
    t.string "folate_unit", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name", default: ""
    t.string "lowest_unit", default: ""
    t.float "lowest_unit_equivalence", default: 0.0
    t.string "abbreviation", default: ""
    t.string "physical_property", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
