require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before(:each) do
    create_list(:category, 10)
  end

  describe "GET /index" do
    it "returns paginated categories" do
      cate = Category.count
      page = 2
      per_page = 2

      get :index, params: { page: page, per_page: per_page }

      expect(response).to be_successful
      json_response = JSON.parse(response.body)
      expect(json_response["categories"].count).to eq(per_page)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_params) do
        { category: { name: "Fashion", title: "Trendsetters' Paradise", content: "Discover the hottest fashion trends and express your unique style" } }
      end

      it "creates a new category" do
        expect {
          post :create, params: valid_params
        }.to change(Category, :count).by(1)
        
        expect(response).to have_http_status(:success)

        json_response = JSON.parse(response.body)
        
        expect(json_response["messages"]).to eq("Category create succefull ")
        
        expect(json_response["category"]["name"]).to eq(valid_params[:category][:name])
        expect(json_response["category"]["title"]).to eq(valid_params[:category][:title])
        expect(json_response["category"]["content"]).to eq(valid_params[:category][:content])
      end
    end
  end

  describe "Get /show" do
    it "return category" do 
      category = Category.first
      get :show, params: {id: category.id }
      expect(response).to be_successful
      json_response = JSON.parse(response.body)
      expect(json_response["messages"]).to eq("Category")
    end
  end

  describe "Patch /update" do
    let(:invalid_params) do
      { name: nil, title: nil, content: nil }
    end 

    it "updates the category" do
      category = Category.first
      patch :update, params: { id: category.id, category: invalid_params }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(category.name).not_to be_nil
      expect(category.title).not_to be_nil
      expect(category.content).not_to be_nil
    end
  end

  describe "Delete /destroy" do 
    it "Destroy category "do 
      category = Category.last
      delete :destroy, params: {id: category.id}
      json_response = JSON.parse(response.body)
      expect(json_response["messages"]).to eq("category_name" => category.name, "success"=> "Category destroyed successfully.")   
    end
  end
end
