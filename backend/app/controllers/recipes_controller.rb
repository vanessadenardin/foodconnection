class RecipesController < ApplicationController
    before_action :set_recipe, only: [:update, :destroy, :show]

    def index
        render json: Recipe.all.order(created_at: :desc), methods: [:imageUrl], status: :ok
    end

    def show
        render json: { recipe: @recipe }, methods: [:username, :imageUrl], include: [:ratings, :dietary_categories, :recipe_dietaries, :recipe_ingredients], status: :ok
    end

    def create
        # clone recipe params to be able to JSON parse the recipe dietaries string
        extra_params = post_params.clone
        extra_params[:recipe_dietaries_attributes] = JSON.parse(extra_params[:recipe_dietaries_attributes])
        extra_params[:recipe_ingredients_attributes] = JSON.parse(extra_params[:recipe_ingredients_attributes])

        @recipe = authenticated.recipes.new(recipe_params)
        if @recipe.save!
            handleDietaries(extra_params[:recipe_dietaries_attributes])
            handleIngredients(extra_params[:recipe_ingredients_attributes])
            render json: @recipe, status: :created
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def update
        # clone recipe params to be able to JSON parse the recipe dietaries string
        extra_params = post_params.clone
        extra_params[:recipe_dietaries_attributes] = JSON.parse(extra_params[:recipe_dietaries_attributes])
        extra_params[:recipe_ingredients_attributes] = JSON.parse(extra_params[:recipe_ingredients_attributes])

        if @recipe.update(recipe_params)
            handleDietaries(extra_params[:recipe_dietaries_attributes])
            handleIngredients(extra_params[:recipe_ingredients_attributes])
            render json: @recipe, status: :ok
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if (@recipe.user.id == authenticated.id || is_admin?)
            if @recipe.destroy
                render json: {message: "Recipe deleted."}, status: :ok
            else
                render json: @recipe.errors, status: 500
            end
        end
    end

    def dietary
        render json: DietaryCategory.all, status: :ok
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def post_params
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
            :image
        )
    end

    def handleIngredients(ingredients)
        for ingredient in ingredients do
            # custom flag from react to mark for deletion
            if ingredient[:delete]
                ingredient = RecipeIngredient.find_by_id(ingredient[:id])
                if ingredient
                    ingredient.delete
                end
            else
                if ingredient.key?("id")
                    # if ID is there, it's EDIT
                    exists = RecipeIngredient.find_by_id(ingredient[:id])
                    exists.update({
                        quantity: ingredient[:quantity],
                        measure_type: ingredient[:measure_type]
                    })
                else
                    # if ingredient don't have ID means that is a new item
                    new_record = RecipeIngredient.new({
                        recipe_id: @recipe.id,
                        ingredient_id: ingredient[:ingredient_id],
                        name: ingredient[:name],
                        quantity: ingredient[:quantity],
                        measure_type: ingredient[:measure_type]
                    })
                    new_record.save
                end
            end
        end
    end

    def handleDietaries(dietaries)
        for diet in dietaries do
            if diet[:delete]
                dietary = RecipeDietary.find_by_id(diet[:id])
                if dietary
                    dietary.delete
                end
            else
                newDietary = RecipeDietary.new({recipe_id: @recipe.id, dietary_category_id: diet[:dietary_category_id]})
                newDietary.save
            end
        end
    end
end
