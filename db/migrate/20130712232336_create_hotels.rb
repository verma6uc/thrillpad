class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.primary_key :id
      t.string :title
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.text :description
      t.text :address
      t.integer :city_id
      t.string :map
      t.integer :number_of_rooms
      t.string :check_out
      t.text :hotel_policies
      t.string :slug

      t.timestamps
    end
  end
end
