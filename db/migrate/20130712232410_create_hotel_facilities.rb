class CreateHotelFacilities < ActiveRecord::Migration
  def change
    create_table :hotel_facilities do |t|
      t.primary_key :id
      t.integer :hotel_id
      t.boolean :hr_room_service
      t.boolean :airport_transfer

      t.timestamps
    end
  end
end
