class Category < ApplicationRecord
	validates :title, :name, :content , presence: true
	has_many :sub_categories, dependent: :destroy

	
	def self.ransackable_attributes(auth_object = nil)
		["content", "created_at", "id", "id_value", "name", "sub_category_id", "title", "updated_at"]
	end
end
