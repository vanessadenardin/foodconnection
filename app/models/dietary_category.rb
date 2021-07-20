class DietaryCategory < ApplicationRecord
    validates :name, presence: true
    validates :name, format: { with: /[a-zA-Z]/}, length: { minimum: 2 }
end

# create_table "dietary_categories", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end
