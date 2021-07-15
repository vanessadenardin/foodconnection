class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, through: :recipe_ingredients
  has_many :dietary_categories, through: :recipe_dietaries
  has_many :ratings 
  # has_one_attached :image
  validates :recipe_name, :recipe_instructions, :cooking_time, :serves, :skill_level, :cuisine, :meal_type, :user_id, presence: :true
  validates :recipe_name, format: {with: /[a-zA-Z]/}, length: { minimum: 2 }
  validates :recipe_instructions, format: {with: /[a-zA-Z]/}, length: { minimum: 20 }
  validates :cooking_time, numericality: { only_integer: true }
  validates :serves, numericality: { only_integer: true }
  validates :skill_level, format: {with: /[a-zA-Z]/}, length: { minimum: 5 }
  validates :cuisine, format: {with: /[a-zA-Z]/}, length: { minimum: 5 }
  validates :meal_type, format: {with: /[a-zA-Z]/}, length: { minimum: 5 }
end
