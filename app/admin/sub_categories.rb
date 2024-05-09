ActiveAdmin.register SubCategory do
  permit_params :name, :category_id

  controller do
    def scoped_collection
      super.page(params[:page]).per(1)
    end
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name


  form do |f|
    f.inputs do
      f.input :name
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
    end
    f.actions
  end

end
