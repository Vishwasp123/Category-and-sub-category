require 'rails_helper'

RSpec.describe SubCategoriesController, type: :controller do
  let(:category) {FactoryBot.create(:category)}
  let(:sub_category) { FactoryBot.create(:sub_category, category: category) }
  let(:valid_params) { { sub_category: { name: "Fashion", category_id: category.id } } }
  let(:invalid_params) { { sub_category:{ name: nil, category_id: category.id } } }

  
  describe "GET /index" do
    context "return a all sub_category" do
     it "all sub_category in category"do  
        get :index , params: { category_id: category.id} 
        expect(response).to be_successful
      end
    end
  end

  describe"Post /create" do  
    context"with valid_params" do
     it "creates a new subcategory" do
        expect {
          post :create, params: { category_id: category.id }.merge(valid_params)
        }.to change(SubCategory, :count).by(1)
         json_response = JSON.parse(response.body)
        
        expect(response).to have_http_status(:success)
        expect(json_response["messages"]).to eq("sub_category create succefull")
      end
    end

    context "invalid params" do
      it "crate invalid subcategory"do 
        post :create, params: {category_id: category.id}.merge(invalid_params)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["messages"]).to eq("not Create ")
        expect(JSON.parse(response.body)["sub_category"]).to eq({"name"=>["can't be blank"]})
      end
    end
  end

  describe "GET #show" do
    context "show sub_category" do
      it "returns a successful response" do
        get :show, params: { category_id: category.id, id: sub_category.id }

        expect(response).not_to have_http_status(:success)
      end
    end
  end
  describe "PATCH #update" do
    let(:category) { FactoryBot.create(:category) }
    let(:sub_category) { FactoryBot.create(:sub_category, category: category) }

    context "with valid params" do
      it "updates the subcategory" do
        patch :update, params: { category_id: category.id, id: sub_category.id, sub_category: { name: "Vishwas" } }

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)["messages"]).to eq("Update Subcategories")
        expect(JSON.parse(response.body)["sub_category"]["name"]).to eq("Vishwas")
      end
    end

    context "with invalid params" do
      it "does not update the subcategory" do
        patch :update, params: { category_id: category.id, id: sub_category.id, sub_category: { name: nil } }

        expect(response).not_to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["messages"]).to eq("Not Update")
      end
    end
  end

  describe "Delete #destroy" do 
    context "when the sub_category exists" do
      it "deletes the sub_category" do
        expect {
          delete :destroy, params: { category_id: category.id, id: sub_category.id }
        }.to change(SubCategory, :count).by(0)
      end

      it "redirects to the category show page" do
        delete :destroy, params: { category_id: category.id, id: sub_category.id }
        expect(response).to be_successful
      end
    end
  end
end
