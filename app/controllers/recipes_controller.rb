class RecipesController < ApplicationController
    before_action :set_recipe, only: [:update, :destroy, :show]

    def index
        render json: Recipe.all.order(recipe_name: :asc), status: :ok
    end

    def show
        render json: @recipe, include: [:ratings, :user], status: :ok
    end

    def create
        @recipe = Recipe.new(recipe_params)
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


    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:recipe_name, :recipe_instructions, :cooking_time, :serves, :skill_level, :user_id, :cuisine, :meal_type)
    end


end
