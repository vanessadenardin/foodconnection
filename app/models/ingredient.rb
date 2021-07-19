class Ingredient < ApplicationRecord
    has_many :recipe_ingredients

    validates :name, presence: :true

    validates :name, format: {with: /[a-zA-Z]/}, length: { minimum: 2 }
end


# create_table "ingredients", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end