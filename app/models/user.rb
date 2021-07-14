class User < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_many :ratings, dependent: :destroy
end
