class User < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_many :ratings, dependent: :destroy
    has_secure_password
    validates :username, :email, :password, :password_confirmation, presence: true
    validates :username, :email, uniqueness: true
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    validates :password, confirmation: {case_sensitive: true}
end
