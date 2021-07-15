class ApplicationController < ActionController::API

    def decode

    end

    
    def encode(payload)
        JWT.encode(payload, Rails.application.credentials.jwt_secret_key)
    end

end
