class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, through: :recipe_ingredients
  has_many :dietary_categories, through: :recipe_dietaries
end
