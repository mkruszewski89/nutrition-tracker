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

ActiveRecord::Schema.define(version: 20180416204320) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_logs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_nutrients", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "nutrient_id"
    t.float "amount_per_ingredient_usda_unit", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", default: ""
    t.string "usda_unit", default: ""
    t.float "density", default: 0.0
    t.string "upc", default: ""
    t.string "usda_no", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutrients", force: :cascade do |t|
    t.string "name", default: ""
    t.string "usda_name", default: ""
    t.string "nutrient_type", default: ""
    t.string "usda_unit", default: ""
    t.string "recommendation_type", default: ""
    t.float "recommendation_amount_I", default: 0.0
    t.float "recommendation_amount_FC", default: 0.0
    t.float "recommendation_amount_MC", default: 0.0
    t.float "recommendation_amount_FP", default: 0.0
    t.float "recommendation_amount_MP", default: 0.0
    t.float "recommendation_amount_FT", default: 0.0
    t.float "recommendation_amount_MT", default: 0.0
    t.float "recommendation_amount_FY", default: 0.0
    t.float "recommendation_amount_MY", default: 0.0
    t.float "recommendation_amount_FA", default: 0.0
    t.float "recommendation_amount_MA", default: 0.0
    t.float "recommendation_amount_FE", default: 0.0
    t.float "recommendation_amount_ME", default: 0.0
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.float "amount_in_recipe"
    t.string "user_defined_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_nutrients", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "nutrient_id"
    t.float "amount_in_recipe", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", default: ""
    t.integer "user_id"
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

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "birthday"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

end
