class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.text :review
      t.datetime :date
      t.references :user, null: true, foreign_key: true
      t.references :recipe, null: true, foreign_key: true

      t.timestamps
    end
  end
end
