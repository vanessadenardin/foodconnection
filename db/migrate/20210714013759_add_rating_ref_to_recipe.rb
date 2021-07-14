class AddRatingRefToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :rating, null: false, foreign_key: true
  end
end
