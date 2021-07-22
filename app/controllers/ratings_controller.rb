class RatingsController < ApplicationController
    before_action :set_rating, only: [:show, :destroy]

    def index
        # Wont be using index at all for ratings
        # render json: Rating.all
        # render json: Rating.all, status: :ok
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
        @rating.destroy
    end

    private

    def set_rating
        @rating = Rating.find(params[:id])
    end

    def rating_params
        # params.require(:rating).permit(:rating, :review, :date, :user_id, :recipe_id)
        params.permit(
            :rating,
            :review,
            :date,
            :user_id,
            :recipe_id
        )
    end

end