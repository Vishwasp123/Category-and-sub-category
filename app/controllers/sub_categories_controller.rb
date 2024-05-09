class SubCategoriesController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :set_sub_categories, only: %i[show destroy update]

	def index
		@sub_categories = SubCategory.all 
		render json: {messages: "SubCategories", sub_categories: @sub_categories}
	end

	def show
 	 @subcategory = SubCategory.find(params[:id]) 
 	 if @subcategory
 	 		render json: { messages: "SubCategory Details", sub_category: @subcategory.name, category: @subcategory.category.name }
 	 else
 	 		render json: { error: "Subcategory not found" }, status: :not_found
 	 end
 	end


 	def create
 		@sub_category = SubCategory.new(subcategories_params)
 		if @sub_category.save
 			render json: {messages: "sub_category create succefull", sub_category: @sub_category}
 		else
 			render json: {messages: "not Create ", sub_category: @sub_category.errors }, status: :unprocessable_entity
 		end
 	end

 	def update
 		if @sub_category.update(subcategories_params)
 			render json: {messages: "Update Subcategories", sub_category: @sub_category }
 		else
 			render json: {messages: "Not Update"} 
 		end
 	end

 	def destroy
 		if @sub_category.destroy
 			render json: {messages: "Destroy SubCategories", sub_category: @sub_category.name}
 		end
 	end

 	private

 	def set_sub_categories
 		@sub_category = SubCategory.find(params[:id])
 	end

 	def subcategories_params
 		params.require(:sub_category ).permit(:name, :category_id)
 	end
end
