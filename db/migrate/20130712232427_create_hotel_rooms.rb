class CreateHotelRooms < ActiveRecord::Migration
  def change
    create_table :hotel_rooms do |t|
      t.primary_key :id
      t.integer :hotel_id
      t.string :title
      t.string :image1
      t.string :image2
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
