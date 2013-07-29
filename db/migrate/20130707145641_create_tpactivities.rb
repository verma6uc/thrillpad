class CreatetTPActivities < ActiveRecord::Migration
  def change
    create_table :tp_activities do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.integer :price
      t.text :tags
      t.belongs_to :city
      t.belongs_to :user
      t.boolean :is_featured
      t.boolean :is_approved
      #t.references :gallerable, polymorphic: true
      #t.integer :gallerable_id
      #t.string  :gallerable_type
      #t.references :gallerable, polymorphic: true
     
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.timestamps
    end
  end
end
