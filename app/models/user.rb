class User < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_many :ratings, dependent: :destroy
    has_secure_password
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
