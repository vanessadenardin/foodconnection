class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, through: :recipe_ingredients
  has_many :dietary_categories, through: :recipe_dietaries
  has_many :ratings 
  # has_one_attached :image
end
