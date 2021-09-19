class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.text :recipe_instructions
      t.integer :cooking_time
      t.integer :serves
      t.string :skill_level
      t.string :cuisine
      t.string :meal_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
