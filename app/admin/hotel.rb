ActiveAdmin.register Hotel do
  index do
    column :id
    column :state_id
    column :slug
    column :is_featured
    column :image1
    column :is_created
    default_actions
  end
end
