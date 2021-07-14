class CreateRecipeDietaries < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_dietaries do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :dietary_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
