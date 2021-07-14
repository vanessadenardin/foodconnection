class CreateDietaryCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :dietary_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
