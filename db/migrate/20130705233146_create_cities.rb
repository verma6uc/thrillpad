class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.primary_key :id
      t.string :title
      t.belongs_to :state
      t.integer :pin_start
      t.integer :pin_end
      t.string :map
      t.text :description
      t.text   :history
      t.string :slug
      t.boolean :is_featured
      t.boolean :is_created
     
     # t.references :gallerable, polymorphic: true
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.timestamps
    end
  end
end
