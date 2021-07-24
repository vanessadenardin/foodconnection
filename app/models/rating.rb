class Rating < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :recipe, optional: true

  validates :rating, :review, :date, :user_id, :recipe_id, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0.01, only_integer: true }
  validates :review, format: { with: /[a-zA-Z]/ }, length: { minimum: 20 }
  # validates :date, 

end
