class RatingsController < ApplicationController
    before_action :set_rating, only: [:show, :destroy]

    def index
        # Wont be using index at all for ratings
        @ratings = Rating.all
        render json: @ratings
    end

    def create
        @rating = authenticated.ratings.new(rating_params)
        if @rating.save
            render json: @rating, status: :created
        else
            render json: @rating.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @rating
    end

    def destroy
        if (@rating.recipe.user.id == authenticated.id || is_admin?)
            if @rating.destroy
                render json: {message: "Rating deleted.", status: :ok }
            else
                render json: @rating.errors, status: 500
            end
        end
    end

    private

    def set_rating
        @rating = Rating.find(params[:id])
    end

    def rating_params
        params.permit(
            :rating,
            :review,
            :date,
            :user_id,
            :recipe_id
        )
    end
end
