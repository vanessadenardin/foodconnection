class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :quantity, presence: :true
  validates :measure_type, presence: :true

  validates :quantity, numericality: { only_integer: true }
  validates :measure_type, format: {with: /[a-zA-Z]/}, length: { minimum: 2 }
end



# create_table "recipe_ingredients", force: :cascade do |t|
#   t.integer "quantity"
#   t.string "measure_type"
#   t.bigint "ingredient_id", null: false
#   t.bigint "recipe_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
#   t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
# end