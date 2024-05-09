class CategoriesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_categories, only: %i[show update destroy]

	def index
		@categories = Category.page(params[:page]).per(params[:per_page])
		render json: {messages: "All Category", categories: @categories }
	end


	def create
		@category = Category.new(category_params)
		if @category.save
			render json: {messages: "Category create succefull ", category: @category}
		else
			render json: @category.errors, status: :unprocessable_entity
		end
	end

	def show
		render json: {messages: "Category", category: @category}
	end

	

	def update
		if @category.update(category_params)
			render json: @category
		else
			render json: @category.errors, status: :unprocessable_entity
		end
	end

	def destroy
		if @category.destroy
			render json: { messages: { category_name: @category.name, success: "Category destroyed successfully." } }
		else
			render json: { messages: { category_name: @category.name, error: "Failed to destroy category." } }
		end
	end


	private

	def set_categories
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name, :title, :content, :sub_category_id)
	end
end
