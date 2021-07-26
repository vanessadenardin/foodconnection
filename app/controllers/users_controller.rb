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
        if is_admin?
            update_user = User.find(params[:id])
            if update_user.update({disabled: true})
                render json: {message: "User deleted.", status: 200 }
            end

        end
    end

    def enable
        if is_admin?
            update_user = User.find(params[:id])
            if update_user.update({disabled: false})
                render json: {message: "User enabled.", status: 200 }
            end
        end
    end

    def sign_up
        @user = User.create(user_params)
        if @user.valid?
            render json: {
                username: @user.username, 
                email: @user.email, 
                token: encode({user_id: @user.id}), 
                admin: @user.admin, 
                id: @user.id, 
                created_at: @user.created_at,
                message: "Successful Login"
            }, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
        
    def login
        @user = User.find_by_username(params[:username])
        if @user && !@user.disabled && @user.authenticate(params[:password])
            render json: {
                username: @user.username, 
                email: @user.email, 
                token: encode({user_id: @user.id}), 
                admin: @user.admin, 
                id: @user.id, 
                created_at: @user.created_at,
                message: "Successful Login", 
                status: :ok
            }
        else
            render json: {error: "Invalid Username or Password", status: 200}
        end
    end

    # if no error means the token works
    def token
        authenticated
    end

    private

    def set_user
        @user = User.find(authenticated.id)
    end

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
