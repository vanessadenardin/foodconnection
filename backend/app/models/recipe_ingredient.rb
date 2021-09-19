class RecipeIngredient < ApplicationRecord
  belongs_to :recipe

  validates :quantity, presence: true
  validates :measure_type, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :measure_type, format: { with: /[a-zA-Z]/ }
end
