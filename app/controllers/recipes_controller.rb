class RecipesController < ApplicationController

    def index
        render json: Recipe.all, status: :ok
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
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            render json: @recipe, status: :ok
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def delete

    end


    private

    def recipe_params
        params.require(:recipe).permit(:recipe_name, :recipe_instructions, :cooking_time, :serves, :skill_level, :user_id, :cuisine, :meal_type)
    end


end
