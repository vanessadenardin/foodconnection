class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :ingredient_id
      t.integer :quantity
      t.string :name
      t.string :measure_type
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
