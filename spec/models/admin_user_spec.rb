require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  let(:admin_user) {create(:admin_user)}
  describe "validations" do 
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end
  describe "ransack_attributes" do 
    it "ransack_attributes rspec" do 
      admin_user_ransack =     ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
      expect(AdminUser.ransackable_attributes).to match_array(admin_user_ransack )
    end
  end
end
