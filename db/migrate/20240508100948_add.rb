class Add < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :sub_category, index: true
  end
end
