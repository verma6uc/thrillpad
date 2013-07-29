class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.primary_key :id
      t.string :ccode
      t.string :currency
      t.string :currency_code
      t.string :title

      t.string :map
      t.text :description
      t.text   :history
      t.string :slug
      
      t.boolean :is_featured
      t.boolean :is_created

      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      
      #t.references :gallerable, polymorphic: true
      t.timestamps
    end
  end
end
