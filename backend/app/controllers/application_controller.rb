class ApplicationController < ActionController::API

    def decode(token)
        JWT.decode(token, Rails.application.credentials.jwt_secret_key)
    end

    def encode(payload)
        JWT.encode(payload, Rails.application.credentials.jwt_secret_key)
    end

    def authenticated
        begin
            token = request.authorization.split(' ')[1]
            decoded = decode(token)
            user_id = decoded[0]['user_id']
            @user = User.find(user_id)
        rescue => exception
            render json: { message: 'Unauthorized: Please log in' }
        end
    end
    
    def current_user
        @user
    end

    def is_admin?
        authenticated.admin
    end
end
