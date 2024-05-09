ActiveAdmin.register Category do
  permit_params :name, :title, :content, :sub_category_id

  controller do
    def scoped_collection
      super.page(params[:page]).per(1)
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :title
    column :content
    actions
  end

  filter :name
  filter :title
  filter :content

  form do |f|
    f.inputs do
      f.input :name
      f.input :title
      f.input :content
    end
    f.actions
  end
end
