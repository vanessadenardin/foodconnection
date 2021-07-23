class RecipeIngredient < ApplicationRecord
  belongs_to :recipe

  validates :quantity, presence: true
  validates :measure_type, presence: true

  validates :quantity, numericality: { only_integer: true }
  validates :measure_type, format: { with: /[a-zA-Z]/ }, length: { minimum: 2 }
end
