require 'csv'

class IngredientsController < ApplicationController
  def index
    render json: get_ingredients, status: :ok
  end 
# end
  # def ingredients
  #   render json: Ingredients.all, status: :ok
  # end

  private

  def get_ingredients
    ingredients = []
    CSV.foreach(Rails.root.join('top-1k-ingredients.csv')) do |row|
      ingredients.push({
        ingredient_id: row[1],
        name: row[0]
      })
    end

    ingredients
  end

end
