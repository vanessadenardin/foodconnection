class RecipeDietary < ApplicationRecord
  belongs_to :recipe
  belongs_to :dietary_category
end



# create_table "recipe_dietaries", force: :cascade do |t|
#   t.bigint "recipe_id", null: false
#   t.bigint "dietary_category_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["dietary_category_id"], name: "index_recipe_dietaries_on_dietary_category_id"
#   t.index ["recipe_id"], name: "index_recipe_dietaries_on_recipe_id"
# end