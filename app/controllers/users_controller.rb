class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy]

    def index
        render json: User.all, status: :ok
    end

    def show
        # can't add the image.url inside the recipe so I have added a new object
        @users = User.all
        render json: @users
    end

    def destroy
        @user.destroy
    end



    def sign_up
        @user = User.create(user_params)
        if @user.valid?
            render json: {username: @user.username, email: @user.email, token: encode({user_id: @user.id}), admin: @user.admin}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
        
    def login
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {message: "Successful Login", token: encode({user_id: @user.id}), admin: @user.admin}, status: :ok
        else
            render json: {error: "Invalid Username or Password"}
        end
    end

    # if no error means the token works
    def token
        authenticated
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
        # params.permit(:username, :email, :password, :password_cofirmation)
    end


end
