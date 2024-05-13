require 'rails_helper'

RSpec.describe Category, type: :model do
    let(:category) {create(:category)}
    let(:valid_attributes) {{name: "Electronics", title:"The Latest in Tech", content:"Stay ahead of the curve with our cutting-edge electronics selection" }}

  describe "with validation" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content)}
    it { should have_many(:sub_categories).dependent(:destroy) }
  end

  describe ".ransack_attributes" do 
    it "return an array of allowed ransack attributes" do 
      expected_attributes = ["content", "created_at", "id", "id_value", "name", "sub_category_id", "title", "updated_at"]
      expect(Category.ransackable_attributes).to match_array(expected_attributes)
    end
  end


end
