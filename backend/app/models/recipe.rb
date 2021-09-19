class Recipe < ApplicationRecord
  def username
    user.username
  end

  def imageUrl
    image.url
  end

  belongs_to :user

  has_many :recipe_ingredients, dependent: :destroy

  has_many :recipe_dietaries, dependent: :destroy
  has_many :dietary_categories, through: :recipe_dietaries

  has_many :ratings, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  
  validates :recipe_name, :recipe_instructions, :cooking_time, :serves, :skill_level, :cuisine, :meal_type, presence: true
  validates :user_id, presence: true
  validates :recipe_name, format: { with: /[a-zA-Z]/ }, length: { minimum: 2 }
  validates :recipe_instructions, format: { with: /[a-zA-Z]/ }, length: { minimum: 20 }
  validates :cooking_time, numericality: { greater_than_or_equal_to: 0.01, only_integer: true }
  validates :serves, numericality: { greater_than_or_equal_to: 0.01, only_integer: true }
  validates :skill_level, format: { with: /[a-zA-Z]/ }, length: { minimum: 5 }
  validates :cuisine, format: { with: /[a-zA-Z]/ }, length: { minimum: 5 }
  validates :meal_type, format: { with: /[a-zA-Z]/ }, length: { minimum: 5 }
end
