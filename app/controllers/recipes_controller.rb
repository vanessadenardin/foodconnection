class RecipesController < ApplicationController
    before_action :set_recipe, only: [:update, :destroy, :show]

    def index
        render json: Recipe.all.order(recipe_name: :asc), status: :ok
    end

    def show
        # can't add the image.url inside the recipe so I have added a new object
        render json: { recipe: @recipe, image: @recipe.image.url }, include: [:ratings, :user, :dietary_categories, :recipe_ingredients], status: :ok
    end

    def create
        # clone recipe params to be able to JSON parse the recipe dietaries string
        local_params = recipe_params.clone
        # local_params[:recipe_dietaries_attributes] = JSON.parse(local_params[:recipe_dietaries_attributes])
        local_params[:recipe_dietaries_attributes] = JSON.parse(local_params[:recipe_dietaries_attributes])
        local_params[:recipe_ingredients_attributes] = JSON.parse(local_params[:recipe_ingredients_attributes])

        @recipe = authenticated.recipes.new(local_params)
        if @recipe.save
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
        params.permit(
            :recipe_name,
            :recipe_instructions,
            :cooking_time,
            :serves,
            :skill_level,
            :user_id,
            :cuisine,
            :meal_type,
            :image,
            :recipe_dietaries_attributes,
            :recipe_ingredients_attributes
        )
    end


end
