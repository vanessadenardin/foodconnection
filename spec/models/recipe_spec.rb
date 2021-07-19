require "rails_helper"

RSpec.describe Recipe, :type => :model do

    it "has a valid factory" do
        recipe = build(:recipe)
        expect(recipe).to be_valid
    end

    context "validations" do
        before(:each) do
          @recipe = build(:recipe)
        end
    
        it "is invalid without a recipe name" do
          recipe = build(:recipe, recipe_name: nil)
          expect(recipe).to_not be_valid
        end

        it "is invalid without a recipe name" do
            recipe = build(:recipe, recipe_name: nil)
            expect(recipe).to_not be_valid
        end

        it "is invalid without recipe instructions" do
            recipe = build(:recipe, recipe_instructions: nil)
            expect(recipe).to_not be_valid
        end

        it "is invalid without a cooking time" do
            recipe = build(:recipe, cooking_time: nil)
            expect(recipe).to_not be_valid
        end

        it "is invalid without serves" do
            recipe = build(:recipe, serves: nil)
            expect(recipe).to_not be_valid
        end

        it "is invalid without a skill level" do
            recipe = build(:recipe, skill_level: nil)
            expect(recipe).to_not be_valid
        end

        it "is invalid without a cuisine" do
            recipe = build(:recipe, cuisine: nil)
            expect(recipe).to_not be_valid
        end

        it "is invalid without a meal type" do
            recipe = build(:recipe, meal_type: nil)
            expect(recipe).to_not be_valid
        end

    end

end


# create_table "recipes", force: :cascade do |t|
#     t.string "recipe_name"
#     t.text "recipe_instructions"
#     t.integer "cooking_time"
#     t.integer "serves"
#     t.string "skill_level"
#     t.string "cuisine"
#     t.string "meal_type"
#     t.bigint "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.bigint "rating_id"
#     t.index ["rating_id"], name: "index_recipes_on_rating_id"
#     t.index ["user_id"], name: "index_recipes_on_user_id"
#   end