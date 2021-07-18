class Rating < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :recipe, optional: true

  validates :rating, :review, :date, :user_id, :recipe_id, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :review, format: {with: /[a-zA-Z]/}, length: { minimum: 20 }
  # validates :date, 

end
