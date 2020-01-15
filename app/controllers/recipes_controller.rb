class RecipesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_recipe, only: [:edit, :update]

	def index
		@recipes = Recipe.order :date_recipe
		@recipes = @recipes.reverse
	end

	def new
		@recipe = Recipe.new
	end

	def create
		values = params.require(:recipe).permit!
		@recipe = Recipe.create values
		if @recipe.save
			redirect_to recipes_path, notice: 'Receita Salva!'
		else
			render :new
		end
	end

	def edit
	end

	def update
		values = params.require(:recipe).permit!
		@recipe.update values
		redirect_to recipes_path, notice: 'Receita Atualizada!'
	end
	
	def destroy
		id = params[:id]
		Recipe.destroy id
		redirect_to recipes_path, notice: 'Receita Excluída!'
	end

	private
		def set_recipe
			@recipe = Recipe.find(params[:id])
		end
end
