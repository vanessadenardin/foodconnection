# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_14_014404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dietary_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.text "review"
    t.datetime "date"
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_ratings_on_recipe_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recipe_dietaries", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "dietary_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dietary_category_id"], name: "index_recipe_dietaries_on_dietary_category_id"
    t.index ["recipe_id"], name: "index_recipe_dietaries_on_recipe_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "quantity"
    t.string "measure_type"
    t.bigint "ingredient_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_name"
    t.text "recipe_instructions"
    t.integer "cooking_time"
    t.integer "serves"
    t.string "skill_level"
    t.string "cuisine"
    t.string "meal_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "rating_id", null: false
    t.index ["rating_id"], name: "index_recipes_on_rating_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "ratings", "recipes"
  add_foreign_key "ratings", "users"
  add_foreign_key "recipe_dietaries", "dietary_categories"
  add_foreign_key "recipe_dietaries", "recipes"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipes", "ratings"
  add_foreign_key "recipes", "users"
end
