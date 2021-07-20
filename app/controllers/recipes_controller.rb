class RecipesController < ApplicationController
    before_action :set_recipe, only: [:update, :destroy, :show]

    def index
        render json: Recipe.all.order(recipe_name: :asc), status: :ok
    end

    def show
        # can't add the image.url inside the recipe so I have added a new object
        render json: {recipe: @recipe, image: @recipe.image.url}, include: [:ratings, :user], status: :ok
    end

    def create
        # puts(authenticated.recipes)
        @recipe = authenticated.recipes.new(recipe_params)
        # params[:recipe_dietaries_attributes] = JSON.parse(params[:recipe_dietaries_attributes])
        # @recipe = Recipe.new(recipe_params)
        # @dietary_categories = DietaryCategory.all
        if @recipe.save!
            render json: @recipe, status: :created
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def update
        if @recipe.update(recipe_params)
            render json: @recipe, status: :ok
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @recipe.destroy
    end

    # get all dietary categories
    def dietary
        render json: DietaryCategory.all, status: :ok

    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(
            :recipe_name,
            :recipe_instructions,
            :cooking_time,
            :serves,
            :skill_level,
            :user_id,
            :cuisine,
            :meal_type,
            :image,
            recipe_dietaries_attributes: [
                :id,
                :dietary_category_id
            ])
    end


end
