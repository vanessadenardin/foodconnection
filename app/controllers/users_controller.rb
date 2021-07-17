class UsersController < ApplicationController

    def sign_up
        @user = User.create(user_params)
        if @user.valid?
            render json: {token: encode({user_id: @user.id})}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
        
    def login
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {message: "Successful Login", token: encode({user_id: @user.id})}, status: :ok
        else
            render json: {error: "Invalid Username or Password"}
        end
    end

    # if no error means the token works
    def token
        authenticated
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
        # params.permit(:username, :email, :password, :password_cofirmation)
    end


end
