class Ingredient < ApplicationRecord
    validates :name, presence: true
    validates :name, format: { with: /[a-zA-Z]/ }, length: { minimum: 2 }

    validates :quantity, numericality: { greater_than_or_equal_to: 0.01, only_integer: true }
    validates :measure_type, format: { with: /[a-zA-Z]/ }

end
