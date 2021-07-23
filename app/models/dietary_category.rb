class DietaryCategory < ApplicationRecord
    validates :name, presence: true
    validates :name, format: { with: /[a-zA-Z]/}, length: { minimum: 2 }
end
