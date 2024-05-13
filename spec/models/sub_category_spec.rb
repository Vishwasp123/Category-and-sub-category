require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  let(:category) {create(:category)}
  let(:valid_attributes) {{name:"Electronics Accessories", category: category}}

  describe "asscociation" do 
    it {should belong_to(:category)}
  end
  describe "validates" do 
    it {should validate_presence_of(:name)}
  end
  describe ".ransack_attributes" do 
    it ".ransack attributes RSpec" do 
      ransack_attributes = ["category_id", "created_at", "id", "id_value", "name", "updated_at"]
      expect(SubCategory.ransackable_attributes).to match_array(ransack_attributes)
    end
  end
end
